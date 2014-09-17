require 'spec_helper'
require 'rspec/its'

describe file('/root/backup_scripts/backup.sh') do
# NOTE: this will run all script files and initiate remote copy 
  it { should be_file }
  its(:content) { should match /^TIMESTAMP=`date \S%y-%m-%d\w%H-%M-%S`/ }

  # map and mount the rbd volume.
  its(:content) { should match /^umount \/musashi_backup/ }
  its(:content) { should match /^rbd unmap \/dev\/rbd1/ }

  its(:content) { should match /^rbd map musashi_backup --pool musashi/ }
  its(:content) { should match /^mount \/dev\/rbd\/musashi\/musashi_backup \/musashi_backup/ }

  # run openstack backup script
  its(:content) { should match /^sh \/root\/backup_scripts\/openstack_backup.sh/ }

  # run bashboard backup script
  its(:content) { should match /^sh \/root\/backup_scripts\/dashboard_backup.sh/ }

  # compress the backup before transfering
  its(:content) { should match /^tar -czvf musashi_backup-[$]TIMESTAMP.tar.gz \/musashi_backup/ }

  # copy backup files to remote machine
  its(:content) { should match /rsync -rvaz --progress musashi_backup-[$]TIMESTAMP.tar.gz deploy@[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:(~)\// }

  # copy restore deployer script
  its(:content) { should match /^rsync -rvaz --progress \/root\/backup_scripts\/restore.sh deploy@[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:~\// }
end

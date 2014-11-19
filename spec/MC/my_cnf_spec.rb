require 'spec_helper'
require 'rspec/its'

describe file('/etc/mysql/my.cnf') do
  its(:content) { should match /port\s+= 3306/ }
  its(:content) { should match /socket\s+= \/var\/run\/mysqld\/mysqld.sock/ }
  its(:content) { should match /socket\s+= \/var\/run\/mysqld\/mysqld.sock/ }
  its(:content) { should match /nice\s+= 0/ }
  its(:content) { should match /default-storage-engine = innodb/ }
  its(:content) { should match /collation-server = utf8_general_ci/ }
  its(:content) { should match /init-connect = 'SET NAMES utf8'/ }
  its(:content) { should match /character-set-server = utf8/ }
  its(:content) { should match /user\s+= mysql/ }
  its(:content) { should match /pid-file	= \/var\/run\/mysqld\/mysqld.pid/ }
  its(:content) { should match /socket\s+= \/var\/run\/mysqld\/mysqld.sock/ }
  its(:content) { should match /port\s+= 3306/ }
  its(:content) { should match /basedir\s+= \/usr/ }
  its(:content) { should match /datadir\s+= \/var\/lib\/mysql/ }
  its(:content) { should match /tmpdir\s+= \/tmp/ }
  its(:content) { should match /lc-messages-dir	= \/usr\/share\/mysql/ }
  its(:content) { should match /skip-external-locking/ }
 # its(:content) { should match /bind-address\s+=\s\d+.\d+.\d+.\d+/ }     # To be updated
  its(:content) { should match /key_buffer\s+= 16M/ }
  its(:content) { should match /max_allowed_packet	= 16M/ }
  its(:content) { should match /thread_stack\s+= 192K/ }
  its(:content) { should match /thread_cache_size\s+= 8/ }
  its(:content) { should match /myisam-recover\s+= BACKUP/ }
  its(:content) { should match /max_connections\s+= 500/ }
  its(:content) { should match /query_cache_limit	= 1M/ }
  its(:content) { should match /query_cache_size\s+= 16M/ }
  its(:content) { should match /log_error = \/var\/log\/mysql\/error.log/ }
  its(:content) { should match /expire_logs_days	= 10/ }
  its(:content) { should match /max_binlog_size\s+= 100M/ }
  its(:content) { should match /quick/ }
  its(:content) { should match /quote-names/ }
  its(:content) { should match /max_allowed_packet	= 16M/ }
  its(:content) { should match /key_buffer\s+= 16M/ }
  its(:content) { should match /!includedir \/etc\/mysql\/conf.d\// }
end

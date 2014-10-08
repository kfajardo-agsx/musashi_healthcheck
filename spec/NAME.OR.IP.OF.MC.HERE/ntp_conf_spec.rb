require 'spec_helper'
require 'rspec/its'

describe file('/etc/ntp.conf') do 
  its(:content) { should match /driftfile \/var\/lib\/ntp\/ntp.drift/ }
  its(:content) { should match /statistics loopstats peerstats clockstats/ }
  its(:content) { should match /filegen loopstats file loopstats type day enable/ }
  its(:content) { should match /filegen peerstats file peerstats type day enable/ }
  its(:content) { should match /filegen clockstats file clockstats type day enable/ }
  its(:content) { should match /server 0.ubuntu.pool.ntp.org/ }
  its(:content) { should match /server \d+.\d+.\d+.\d+/ }
  its(:content) { should match /restrict -4 default kod notrap nomodify nopeer noquery/ }
  its(:content) { should match /restrict -6 default kod notrap nomodify nopeer noquery/ }
  its(:content) { should match /restrict \d+.\d+.\d+.\d+/ }
  its(:content) { should match /restrict ::1/ }
  its(:content) { should match /disable monitor/ }
  its(:content) { should match /fudge \d+.\d+.\d+.\d+ stratum 1/ }
end

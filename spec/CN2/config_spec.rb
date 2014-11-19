require 'spec_helper'

#Directory of config files
describe file('/root/.ssh/config') do
  it { should be_file }
end

describe file('/home/deploy/.ssh/config') do
  it { should be_file }
end

describe file('/etc/ntp.conf') do
	it { should be_file }
end

describe file('/etc/mysql/my.cnf') do
	it { should be_file }
end

describe file('/etc/nova/nova.conf') do
	it { should be_file }
end

describe file('/etc/nova/policy.json') do
	it { should be_file }
end

describe file('/etc/nova/nova.conf') do
	it { should be_file }
end

describe file('/etc/nova/policy.json') do
	it { should be_file }
end

describe file('/etc/lvm/lvm.conf') do
	it { should be_file }
end

describe file('/etc/diamond/diamond.conf') do
	it { should be_file }
end

describe file('/etc/rsyslog.d/100-musashi.conf') do
	it { should be_file }
end

describe file('/etc/diamond/collectors/MusashiSNMPCollector.conf') do
	it { should be_file }
end

describe file('/etc/diamond/collectors/Target_MusashiSNMPCollector.csv') do
	it { should be_file }
end
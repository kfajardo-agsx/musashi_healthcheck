require 'spec_helper'

# CHECK SERVICES

describe service('nova-compute') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-api-metadata') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-network') do
  it { should be_enabled   }
  it { should be_running   }
end

# CHECK PORTS

#python
describe port (8775) do
  it { should be_listening.with('tcp') }
end

#dnsmasq
describe port (53) do
  it { should be_listening.with('tcp') }
end

#sshd
describe port (22) do
  it { should be_listening.with('tcp') }
end

#qemu-system-x
describe port (5975) do
	it { should be_listening.with('tcp')}
end

#qemu-system-x
describe port (5900) do
	it { should be_listening.with('tcp')}
end

#qemu-system-x8
describe port (5904) do
	it { should be_listening.with('tcp')}
end

##python
#describe port (41807) do
#	it { should be_listening.with('udp')}
#end

#ntpd
describe port (123) do
	it { should be_listening.with('udp')}
end

##python
#describe port (60692) do
#	it { should be_listening.with('udp')}
#end

#rsyslogd
describe port (57573) do
	it { should be_listening.with('udp')}
end

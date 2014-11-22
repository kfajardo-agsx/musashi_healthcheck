require 'spec_helper'
require 'rspec/its'

# CHECK SERVICES
describe package('apache2')  do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled   }
  it { should be_running   }
end

describe package('keystone') do
  it { should be_installed }
end

describe service('glance-registry') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('glance-api') do
  it { should be_enabled   }
  it { should be_running   }
end

describe package('rabbitmq-server') do
  it { should be_installed }
end

describe service('cinder-volume') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('cinder-api') do
  it { should be_enabled   }
  it { should be_running   }
end

describe package('cinder-scheduler') do
  it { should be_installed   }
end

describe service('nova-cert') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-api') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-consoleauth') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-conductor') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-scheduler') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('nova-novncproxy') do
  it { should be_enabled   }
  it { should be_running   }
end

describe service('docker') do
  it { should be_enabled   }
  it { should be_running   }
end

# Docker containers
describe service('graphite') do
  it { should be_running   }
end

describe service('riemann') do
  it { should be_running   }
end

describe service('logstash') do
  it { should be_running   }
end

describe service('dashboard') do
  it { should be_running   }
end
\
# CHECK DEFAULT PORTS
describe port (3306) do
  it { should be_listening.with('tcp') }
end

describe port (35357) do
  it { should be_listening.with('tcp') }
end

describe port (8774) do
  it { should be_listening.with('tcp') }
end

describe port (8776) do
  it { should be_listening.with('tcp') }
end

describe port (8773) do
  it { should be_listening.with('tcp') }
end

describe port (8775) do
  it { should be_listening.with('tcp') }
end

describe port (5000) do
  it { should be_listening.with('tcp') }
end

describe port (6080) do
  it { should be_listening.with('tcp') }
end

describe port (9292) do
  it { should be_listening.with('tcp') }
end

describe port (9191) do
  it { should be_listening.with('tcp') }
end

describe port (80) do #apache2
  it { should be_listening.with('tcp6') }
end

describe port (81) do #dashboard via docker
  it { should be_listening }
end

describe port (514) do #logstash
  it { should be_listening }
end

describe port (5555) do #riemann
  it { should be_listening }
end

describe port (2003) do #graphite
  it { should be_listening }
end

describe port (3260) do #iSCI
  it { should be_listening.with('tcp') }
end

describe port (4369) do #rabbitmq
  it { should be_listening.with('tcp') }
end

describe port (11211) do #memcached
  it { should be_listening.with('tcp') }
end

describe port (6379) do #redis-server
  it { should be_listening.with('tcp') }
end

describe port (53) do #named (DNS)
  it { should be_listening.with('tcp') }
end
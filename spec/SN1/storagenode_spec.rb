require 'spec_helper'
require 'rspec/its'

# CHECK SERVICES
describe service('diamond')  do
  it { should be_running }
end

describe service('supervisord') do
  it { should be_running }
end

describe service('graphite') do
  it { should be_running   }
end

describe service('gunicorn_django') do
  it { should be_running }
end

describe service('honcho') do
  it { should be_running }
end

describe service('gunicorn') do
  it { should be_running   }
end


# CHECK DEFAULT PORTS
describe port (6804) do   # ceph-osd
  it { should be_listening.with('tcp') }
end

describe port (6805) do   # ceph-osd
  it { should be_listening.with('tcp') }
end

describe port (22) do   # sshd
  it { should be_listening.with('tcp') }
end

describe port (6789) do   # ceph-mon
  it { should be_listening.with('tcp') }
end

describe port (6800) do   # ceph-osd
  it { should be_listening.with('tcp') }
end

describe port (6801) do   # ceph-osd
  it { should be_listening.with('tcp') }
end

describe port (6802) do   # ceph-osd
  it { should be_listening.with('tcp') }
end

describe port (6803) do   # ceph-osd
  it { should be_listening.with('tcp') }
end

describe port (2004) do   # docker: acaleph-frontend/graphite,graphite
  it { should be_listening }
end

describe port (7002) do   # docker : acaleph-frontend/graphite,graphite
  it { should be_listening }
end

describe port (8126) do   # docker : acaleph-frontend/graphite,graphite
  it { should be_listening }
end

describe port (8080) do   # docker: acaleph-frontend/graphite,graphite
  it { should be_listening }
end

describe port (8081) do   # docker: acaleph-frontend/graphite,graphite
  it { should be_listening }
end

describe port (8082) do   # docker: acaleph-frontend/graphite,graphite
  it { should be_listening }
end
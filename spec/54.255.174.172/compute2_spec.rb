require 'spec_helper'

# CHECK DEFAULT PORTS
describe port (8775) do
  it { should be_listening.with('tcp') }
end

#describe port (53) do
#  it { should be_listening.with('tcp') }
#end

describe port (22) do
  it { should be_listening.with('tcp') }
end
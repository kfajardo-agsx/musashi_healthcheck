require 'spec_helper'
require 'rspec/its'

#VLAN-configured and bonded
describe file('/etc/modules') do
  its(:content) { should match /^bonding/ }
  its(:content) { should match /^8021q/ }
end
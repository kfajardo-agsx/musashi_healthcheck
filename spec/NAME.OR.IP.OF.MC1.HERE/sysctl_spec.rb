require 'spec_helper'
require 'rspec/its'

describe file('/etc/sysctl.conf') do
  its(:content) { should match /^net.ipv4.conf.default.rp_filter=0/ }
  its(:content) { should match /^net.ipv4.conf.all.rp_filter=0/ }
end
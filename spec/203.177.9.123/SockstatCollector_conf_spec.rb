require 'spec_helper'
require 'rspec/its'

describe file ('/etc/diamond/collectors/SockstatCollector.conf') do
  its(:content) { should match /^enabled = False/ }
end

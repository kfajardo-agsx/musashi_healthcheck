require 'spec_helper'
require 'rspec/its'

describe file ('/etc/diamond/collectors/VMStatCollector.conf') do
  its(:content) { should match /^enabled = False/ }
end
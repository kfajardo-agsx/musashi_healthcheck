require 'spec_helper'
require 'rspec/its'

describe file ('/etc/diamond/collectors/MusashiCPUCollector.conf') do
  its(:content) { should match /^enabled = True/ }
  its(:content) { should match /^ttl_multiplier = 2/ }
  its(:content) { should match /^normalize = False/ }
  its(:content) { should match /^measure_collector_time = False/ }
  its(:content) { should match /^byte_unit = byte,/ }
  its(:content) { should match /^simple = True/ }
  its(:content) { should match /^percore = True/ }
  its(:content) { should match /^path_suffix = ""/ }
  its(:content) { should match /^splay = 1/ }
  its(:content) { should match /^instance_prefix = instances/ }
  its(:content) { should match /^interval = 300/ }
  its(:content) { should match /^path_prefix = servers/ }                  
  its(:content) { should match /^method = Sequential/ }
end 

require 'spec_helper'
require 'rspec/its'

describe file ('/etc/diamond/collectors/MusashiDiskSpaceCollector.conf') do
  its(:content) { should match /^enabled = True/ }
  its(:content) { should match /^ttl_multiplier = 2/ }
  its(:content) { should match /^splay = 1/ }
  its(:content) { should match /^path_suffix = ""/ }
  its(:content) { should match /^measure_collector_time = False/ }
  its(:content) { should match /^instance_prefix = instances/ }
  its(:content) { should match /^interval = 300/ }
  its(:content) { should match /^path_prefix = servers/ }
end 

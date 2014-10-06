require 'spec_helper'
require 'rspec/its'

describe file ('/etc/diamond/collectors/Target_MusashiPingCollector.csv') do
  its(:content) { should match /(.*?)-cn(.*?),(.*?)-cn(.*?).musashi.ph/ }
  its(:content) { should match /(.*?)-mc,(.*?)-mc.musashi.ph/ }
  its(:content) { should match /(.*?)-sn(.*?),(.*?)-sn(.*?).musashi.ph/ }
  its(:content) { should match /(.*?)-sn(.*?),(.*?)-sn(.*?).musashi.ph/ }
end
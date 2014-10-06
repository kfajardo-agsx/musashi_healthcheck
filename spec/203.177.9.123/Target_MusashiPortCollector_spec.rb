require 'spec_helper'
require 'rspec/its'

describe file ('/etc/diamond/collectors/Target_MusashiPortCollector.csv') do
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,22,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,80,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,8080,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,5000,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,35357,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,8774,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,8776,tcp/ }
  its(:content) { should match /^(.*?)-mc,(.*?)-mc.musashi.ph,9292,tcp/ }
  its(:content) { should match /^(.*?)-cn(.*?),(.*?)-cn(.*?).musashi.ph,22,tcp/ }
  its(:content) { should match /^(.*?)-sn(.*?),(.*?)-sn(.*?).musashi.ph,22,tcp/ }
  its(:content) { should match /^(.*?)-sn(.*?),(.*?)-sn(.*?).musashi.ph,22,tcp/ }
end
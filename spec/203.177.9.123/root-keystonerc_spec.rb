require 'spec_helper'
require 'rspec/its'

describe file('/root/keystonerc') do
  its(:content) { should match /^export OS_USERNAME=admin/ }
  its(:content) { should match /^export OS_PASSWORD=(.*?)/ }
  its(:content) { should match /^export OS_TENANT_NAME=admin/ }
  its(:content) { should match /^export OS_AUTH_URL=http:\/\/\b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b:35357\/v2.0/ }
end
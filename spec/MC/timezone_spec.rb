require 'spec_helper'
require 'rspec/its'

describe file('/etc/timezone') do
  its(:content) { should match /^Etc\/UTC/ }
end
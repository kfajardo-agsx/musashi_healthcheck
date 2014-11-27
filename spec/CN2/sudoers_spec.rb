require 'spec_helper'
require 'rspec/its'

describe command('whoami') do
  it { should return_stdout 'root' }
end

describe file('/etc/sudoers') do
	its(:content) { should match /^[%]ubuntu\s+ALL[=][(]ALL[:]ALL[)]\s+NOPASSWD[:]ALL/ }
end
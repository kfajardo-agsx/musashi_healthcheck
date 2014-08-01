require 'serverspec'
require 'pathname'
require 'net/ssh'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

RSpec.configure do |c|
  c.host  = ENV['HOST']
  options = Net::SSH::Config.for(c.host)
  options[:password] = ENV['PASSWORD']
  user    = ENV['USER']
  c.ssh   = Net::SSH.start(c.host, user, options)
end

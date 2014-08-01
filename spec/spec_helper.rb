require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'highline/import'

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.host  = ENV['HOST']
  options = Net::SSH::Config.for(c.host)
  
  if ENV['ASK_SUDO_PASSWORD']
    c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end

  if ENV['ASK_LOGIN_PASSWORD']
    options[:password] = ask("\nEnter login password: ") { |q| q.echo = false }
  else
    options[:password] = ENV['PASSWORD']
  end

  user    = ENV['USER']
  c.ssh   = Net::SSH.start(c.host, user, options)
end
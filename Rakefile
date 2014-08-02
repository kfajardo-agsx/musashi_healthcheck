require 'rake/testtask'
require 'rspec/core/rake_task'

namespace 'HC' do
  desc "Check dashboard functions"
  task :dashboard do
    file = "test_scripts/dashboard_actions.rb"
    system("ruby #{ file }")
  end

  desc "Check controller settings, include USER and KEY on command"
  task :serverspeckey do
    system("USER=#{ENV['USER']} KEY=#{ENV['KEY']} rake spec")
  end
  
  desc "Check controller settings, include USER on command"
  task :serverspecpassword do
    system("USER=#{ENV['USER']} ASK_SUDO_PASSWORD=true ASK_LOGIN_PASSWORD=true rake spec")
  end

  desc "Check controller settings, include USER and KEY on command"
  task :createuserprojkey do
    system("USER=#{ENV['USER']} KEY=#{ENV['KEY']} rake dbinjection")
  end

  desc "Run nova commands before dashboard actions, include USER on command"
  task :createuserprojpassword do
    system("USER=#{ENV['USER']} ASK_SUDO_PASSWORD=true ASK_LOGIN_PASSWORD=true rake dbinjection")
  end  
end

task :default do
    puts("Please run \'rake -T\' to see possible rake commands")
end

desc "Run serverspec"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Run db injection"
RSpec::Core::RakeTask.new(:dbinjection) do |t|
  t.pattern = 'spec/*/*_command.rb'
end
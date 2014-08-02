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
  
end

task :default do
    puts("Please run \'rake -T\' to see possible rake commands")
end

desc "Run serverspec"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end
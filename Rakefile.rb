require 'rake/testtask'
require 'rspec/core/rake_task'

namespace 'HC' do
  desc "Check dashboard functions"
  task :dashboard do
    file = "test_scripts/dashboard_actions.rb"
    system("ruby #{ file }")
  end

  desc "Check controller settings"
  task :serverspec do
    system("HOST=203.177.9.123 USER=musashi ASK_LOGIN_PASSWORD=true ASK_SUDO_PASSWORD=true rake spec")
  end
end

desc "Run health checks"
task :default => ["HC:serverspec", "HC:dashboard"]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end
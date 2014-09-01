require 'rake/testtask'
require 'rspec/core/rake_task'

namespace 'HC' do
  desc "Check dashboard functions, include environment options on command"
  task :dashboard do
    file = "test_scripts/dashboard_actions.rb"
    system("ruby #{ file }")
  end

  desc "Check host settings, include environment options on command"
  task :serverspec do
    system("rake spec")
  end
end

task :default do
    puts("Please run \'rake -T\' to see possible rake commands")
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end
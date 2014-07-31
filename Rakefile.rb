require 'rake/testtask'

namespace 'health_check' do
  desc "Health Check for dashboard actions"
  task :dashboard do
    file = "test_scripts/project_actions.rb"
      system("ruby #{ file }")
  end
end

task :default do
    system("rake health_check:dashboard")
end
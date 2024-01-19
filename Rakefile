# Rakefile Group rspec tests with integration test

require_relative "config/application"
Rails.application.load_tasks

desc 'Run Playwright tests'
task :playwright_test do
  sh 'npx playwright test'
end

desc 'Run all tests'
task :test_all do
  # Run RSpec tests
  Rake::Task['spec'].invoke
  # Run Playwright tests
end

# If you don't have an existing :spec task, you need to define it as well
task :spec do
  sh 'bundle exec rspec'
end

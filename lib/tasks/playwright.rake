# lib/tasks/playwright.rake
namespace :playwright do
  desc 'Run Playwright integration tests'
  task :run do
    system('npx playwright test')
  end
end

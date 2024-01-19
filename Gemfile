source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'tailwindcss-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', groups: %i[development test]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'selenium-webdriver'
end

gem 'devise'
gem 'rubocop', '>= 1.0', '< 2.0'
# Gemfile
gem 'sassc-rails'

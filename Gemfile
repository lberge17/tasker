source 'http://rubygems.org'

ruby '2.6.4'
gem 'sinatra'
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'rack-flash3'
gem 'dotenv'

group :development do
  gem 'sqlite3', '~> 1.3.6'
end

group :production do
  gem 'pg', '~> 0.15'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

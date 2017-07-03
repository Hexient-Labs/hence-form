source "https://rubygems.org"
ruby "2.4.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bugsnag"
gem "devise"
gem "erb2haml"
gem "haml-rails"
gem "inky-rb", require: "inky"
gem "jbuilder"
gem "pg"
gem "premailer-rails"
gem "pry-rails"
gem "puma"
gem "rails"
gem "redis"
gem "redis-namespace"
gem "sass-rails"
gem "sidekiq"
gem "sqlite3"
gem "uglifier"

group :development, :test do
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-inline"
  gem "spring"
end

group :development do
  gem "brakeman"
  gem "bundler-audit"
  gem "license_finder"
  gem "mdl"
  gem "overcommit"
  gem "rails_best_practices"
  gem "rubocop"
end

group :test do
  gem "capybara"
  gem "faker"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end

group :production do
  gem "rails_12factor"
end

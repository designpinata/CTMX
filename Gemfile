ruby "2.4.2"

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails'
gem 'geocoder'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'ffaker'
gem 'gentelella-rails'
gem 'rails-i18n', '~> 5.0.0'
gem 'simplemde-rails'
gem 'redcarpet'
gem "cocoon"
gem 'jquery-ui-rails'
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'
gem 'bootstrap-sass', '~> 3.3.7'
gem "font-awesome-rails"
gem 'paperclip'
gem 'aws-sdk'
gem 'aws-sdk-s3'
gem 'instagram_api_client'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

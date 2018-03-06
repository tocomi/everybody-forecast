source 'https://rubygems.org'

ruby "2.5.0" # for heroku
gem 'rails',        '5.0.1'
gem 'puma',         '3.4.0'
gem 'sass-rails',   '5.0.7'
gem 'uglifier',     '3.0.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.2.0'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'chef',         '12.10.24'
gem 'knife-solo',   '0.6.0'
gem 'berkshelf',    '6.3.1'
gem 'composite_primary_keys', '9.0.8'

group :development, :test do
  gem 'sqlite3',    '1.3.11'
  gem 'byebug',     '9.0.0', platform: :mri
  gem 'capistrano', '3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.0.8'
  gem 'spring',                '1.7.2'
  gem 'spring-watcher-listen', '2.0.0'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

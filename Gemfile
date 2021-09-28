source 'https://rubygems.org'
ruby '2.6.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.11'
gem 'mime-types'

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.21'

# Use puma as the web server
gem 'puma', '>= 3.1.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'normalize-rails'

# For mobile menu, mmenu must be 5.5.3 or lower
gem 'mmenu-rails', git: 'https://github.com/akosipc/mmenu-rails', branch: 'master'
gem 'friendly_id-globalize', git: 'https://github.com/norman/friendly_id-globalize', branch: 'master'
gem 'font-awesome-sass'

# Neat bourbon RWD Framework
gem 'neat', '~> 1.8'
gem 'bourbon', '~> 4.2'
gem 'bitters'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.9'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "pry"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.3'

  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'sextant'
  gem 'guard', '>= 2.2.2',       :require => false
  gem 'guard-livereload',        :require => false
  gem 'rack-livereload'
  gem 'rb-fsevent',              :require => false
  gem 'figaro'
end

group :production do
  # Heroku
  gem 'dragonfly-s3_data_store'
  gem 'rails_12factor'
  gem 'whenever', :require => false

  # Caching strategy
  gem 'actionpack-page_caching'
  gem 'rack-cache'
  gem 'kgio'
  gem 'dalli'
  gem 'memcachier'
end

gem 'refinerycms', '~> 3.0.6'

# Add support for searching inside Refinery's admin interface.
gem 'refinerycms-acts-as-indexed', '~> 3.0'

# Add support for Refinery's custom fork of the visual editor WYMeditor.
gem 'refinerycms-wymeditor', ['~> 1.0', '>= 1.0.6']

# The default authentication adapter
gem 'refinerycms-authentication-devise', '~> 1.0'
gem 'devise', git: 'https://github.com/plataformatec/devise', branch: '3-stable'

gem 'refinerycms-copywriting', git: 'https://github.com/unixcharles/refinerycms-copywriting', branch: 'master'

gem 'refinerycms-blog', '~> 3.0.1'
gem 'refinerycms-teams', git: 'https://github.com/parndt/refinerycms-teams', branch: 'patch-1'
gem 'refinerycms-page-images', '~> 3.0.0'

gem 'refinerycms-extensions', path: 'vendor/extensions'

# Use Httparty for ProjectHelper
gem 'httparty'

# Extend Blog
gem "readingtime"

# For the guides
gem "kramdown"
gem "kramdown-parser-gfm"
gem "coderay"
gem "sidekiq"
gem "octokit"
gem 'active_link_to'

gem 'refinerycms-guides', path: 'vendor/extensions'

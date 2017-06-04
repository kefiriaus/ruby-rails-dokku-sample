source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"

  gem 'rubocop' # to check Ruby code
  gem 'scss-lint' # to check SCSS code

  gem 'phare' # check for coding style errors

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Project

gem 'rails-i18n', '~> 5.0', '>= 5.0.3'

# ENV variables
gem 'figaro', github: 'morizyun/figaro'

# Database based asynchronous priority queue system
# gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.2'
# gem 'daemons', '~> 1.2', '>= 1.2.4'

# ActiveAdmin
gem 'activeadmin', '~> 1.0'
gem 'inherited_resources', '~> 1.7', '>= 1.7.2'
gem 'bootstrap-sass'
gem 'active_bootstrap_skin'
#gem "active_material", github: "vigetlabs/active_material" # , branch: 'nh-responsive-redesign'

gem 'devise', '~> 4.3'
gem 'devise-i18n', '~> 1.1', '>= 1.1.2'
gem 'omniauth' # Standardized Multi-Provider Authentication (facebook, vk, ok, instagram, etc.)
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'omniauth-odnoklassniki'
gem 'omniauth-instagram'

gem 'carrierwave', '~> 1.1'
gem "mini_magick"

# Email validator
gem 'validates_email_format_of'

# Meta tags
gem 'meta-tags'

# Error pages
gem 'gaffe'

# Complete Ruby geocoding solution
gem 'geocoder'

# Menu DSL
gem "navigator"

# Breadcrumbs
gem "breadcrumbs_on_rails"

# Comments
gem 'acts_as_commentable'

# Tags
gem 'acts-as-taggable-on', '~> 4.0'
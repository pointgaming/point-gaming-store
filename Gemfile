source 'https://rubygems.org'

gem 'rails', '~> 3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

gem 'redis-rails'
gem 'tire'
gem 'resque', :require => "resque/server"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
end

group :development do
  gem 'quiet_assets'
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller", ">= 0.6.8"
  gem 'meta_request'
end

gem 'jquery-rails'

gem 'god', require: false
gem 'capistrano'
gem 'capistrano-ext'

gem 'devise'

gem 'twitter-bootstrap-rails'

gem 'spree', '~> 2.0.3'
gem 'spree_gateway', :git => 'https://github.com/spree/spree_gateway.git'
gem 'spree_bootstrap', github: 'jdutil/spree_bootstrap'

gem "point_gaming_frontend", git: "git@github.com:pointgaming/point-gaming-frontend.git", branch: 'master'

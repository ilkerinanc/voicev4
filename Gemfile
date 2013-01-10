source :rubygems

gem 'rails', '3.2.8'
gem 'rake'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'trinidad'
gem 'activerecord-jdbcmysql-adapter'

gem 'jruby-openssl'
gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
end

gem 'redis'
gem 'recommendable'
gem 'resque'
gem 'resque-loner'

gem 'jquery-rails'
gem "nifty-generators", :group => :development
gem "bcrypt-ruby", :require => "bcrypt"
# gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', :branch => 'static'
gem 'bootstrap-datepicker-rails'
# gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'bootstrap-timepicker-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# the javascript engine for execjs gem
platforms :jruby do
  group :assets do
    gem 'therubyrhino'
  end
end

gem "mocha", :group => :test
gem 'faker'
gem 'omniauth-facebook'
gem 'koala'
gem 'warbler'


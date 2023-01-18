source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'bcrypt', '~> 3.1.18'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'active_model_serializers', '~> 0.10.2'
gem 'sneakers', '~> 2.12'
gem 'redis', '~> 5.0', '>= 5.0.5'
gem 'grpc', '~> 1.50.0'
gem 'grpc-tools', '~> 1.50.0'
gem 'gruf', '~> 2.16.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem "sqlite3", "~> 1.4"
end

group :production do
  gem 'pg', '~> 1.4', '>= 1.4.3'
end

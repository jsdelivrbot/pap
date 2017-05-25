source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'attachinary', github: 'assembler/attachinary'
gem "autoprefixer-rails"
gem "bootstrap-sass"
gem 'cloudinary', '1.1.7'
gem 'coffee-rails'
gem "coffee-rails"
gem 'devise'
gem 'faker', '~> 1.6', '>= 1.6.3'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem "font-awesome-sass"
gem "geocoder"
gem "gmaps4rails"
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-fileupload-rails'
gem 'pg', '~> 0.18'
gem 'omniauth-facebook'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.3'
gem 'sass-rails', '~> 5.0'
gem "simple_form"
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'geocoder'


source 'https://rails-assets.org' do
  gem 'rails-assets-ScrollToFixed'
end

source 'https://rails-assets.org' do
  gem "rails-assets-underscore"
end

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem "letter_opener"
  gem 'listen', '~> 3.0.5'
  gem 'pry', '~> 0.10.4'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem 'rails', '~> 5.0.3'
gem 'devise'
gem 'omniauth-facebook'

gem 'pg', '~> 0.18'

gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem "bootstrap-sass"
gem "font-awesome-sass"
gem "simple_form"
gem "autoprefixer-rails"
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'cloudinary', '~> 1.8', '>= 1.8.1'
gem 'jbuilder', '~> 2.5'





group :development, :test do

  gem 'byebug', platform: :mri
end

group :development do

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'pry', '~> 0.10.4'


  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

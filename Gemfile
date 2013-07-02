source "https://rubygems.org"

gem "rake"

group :development, :test do
  gem "rspec"

  if ENV["CI"]
    gem "coveralls", :require => false
  else
    gem "pry"
    gem "guard-rspec"
    gem "rb-inotify", :require => false # Linux
    gem "rb-fsevent", :require => false # OS X
    gem "rb-fchange", :require => false # Windows
    gem "terminal-notifier-guard"
    gem "ruby-prof", :platforms => :mri
  end
end

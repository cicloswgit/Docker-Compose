# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
#ActiveRecord::Migration.maintain_test_schema!

if ENV['SELENIUM_REMOTE_HOST']
  Capybara.javascript_driver = :selenium_remote_firefox
  Capybara.register_driver "selenium_remote_firefox".to_sym do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: "http://#{ENV['SELENIUM_REMOTE_HOST']}:4444/wd/hub",
      desired_capabilities: :firefox)
  end
else
	Capybara.javascript_driver = :selenium_remote_firefox
	Capybara.register_driver "selenium_remote_firefox".to_sym do |app|
	  Capybara::Selenium::Driver.new(app, browser: :remote, url: "http://localhost:4444/wd/hub", desired_capabilities: :firefox)
	end
end

=begin
Capybara.javascript_driver = :selenium_remote_firefox
Capybara.register_driver "selenium_remote_firefox".to_sym do |app|
  Capybara::Selenium::Driver.new(app, browser: :remote, url: "http://localhost:4444/wd/hub", desired_capabilities: :firefox)
end
=end


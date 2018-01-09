require_relative 'spec_helper'

def firefox_profile
  Selenium::WebDriver::Firefox::Profile.new
end

def firefox_options
  options = {:browser => :firefox}
  options[:profile] = firefox_profile
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 100
  options[:http_client] = http_client
  options
end
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :selenium_chrome


Dir.glob(File.join(File.expand_path("../../pages", __FILE__), "**", "*.rb")).each do |page_class|
  require page_class
end

$home_page = HomePage.new

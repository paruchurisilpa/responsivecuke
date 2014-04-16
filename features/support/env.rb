require 'selenium/webdriver'
require 'capybara/cucumber'
 
url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub.browserstack.com/wd/hub"
 
capabilities = Selenium::WebDriver::Remote::Capabilities.new
 
capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

capabilities['browserstack.debug']=true
 
if ENV['BS_AUTOMATE_OS']
  capabilities['os'] = ENV['BS_AUTOMATE_OS']
  capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
else
  capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
end
 
capabilities['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
capabilities['browser_version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']
 
Capybara.register_driver :browserstack do |app|
  Capybara::Selenium::Driver.new(app, :browser => :remote, :url => url, :desired_capabilities => capabilities)
end
 
Capybara.default_driver = :browserstack
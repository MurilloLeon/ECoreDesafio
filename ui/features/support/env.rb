require 'rspec'
require 'yaml'
require 'pry'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'json'
require 'report_builder'

Capybara.default_max_wait_time = 30

EL = YAML.load_file('data/elements.yml')
DATA = YAML.load_file('data/data.yml')

if ENV['dev']
  $environment = "dev"
elsif ENV['qa']
  $environment = "qa"
elsif ENV['prod']
  $environment = "prod"
else
  $environment = "qa"
end

$report_time = Time.now.strftime("%d:%m %H-%M")
$report_title = "Data: #{Time.now.strftime("%d/%m")}, Hora: #{Time.now.strftime("%H:%M")}"

if ENV['chrome']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-web-security')
    options.add_argument('--reduce-security-for-testing')
    options.add_argument('--disable-print-preview')
    options.add_argument('--incognito')
    Capybara::Selenium::Driver.new(app,browser: :chrome, options: options) 
  end
elsif ENV['chrome_headless']
  Capybara.default_driver = :chrome_headless
  Capybara.register_driver :chrome_headless do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-web-security')
    options.add_argument('--reduce-security-for-testing')
    options.add_argument('--incognito')
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    Capybara::Selenium::Driver.new(app,browser: :chrome, options: options)
  end
elsif ENV['firefox']
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
elsif ENV['headless_debug']
  Capybara.default_driver = :poltergeist_debug
  Capybara.register_driver :poltergeist_debug do |app|
    Capybara::Poltergeist::Driver.new(app, inspector: true)
  end
  Capybara.javascript_driver = :poltergeist_debug
elsif ENV['headless']
  Capybara.javascript_driver = :poltergeist
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-web-security')
    options.add_argument('--reduce-security-for-testing')
    options.add_argument('--disable-print-preview')
    options.add_argument('--incognito')
    Capybara::Selenium::Driver.new(app,browser: :chrome, options: options) 
  end
end
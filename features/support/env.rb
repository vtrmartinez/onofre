require 'rspec'
require 'yaml'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'pry'
require 'site_prism'

include Capybara::DSL

USER = (YAML.load_file('./features/fixtures/user.yml'))

Capybara.register_driver :selenium do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 10
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => 
                                                   {"args" => [ "start-maximized",
                                                                  "--no-sandbox",
                                                   "--disable-web-security",
                                                   "--no-first-run",
                                                   "--no-check-default-driver",
                                                   "--allow-running-insecure-content"  ]})
    Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps , :http_client => client })                
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 3

page = lambda {|klass| klass.new}

Before do
  @page = page
end
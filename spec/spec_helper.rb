require 'capybara/rspec'
require 'factory_bot'
require 'simplecov'

Capybara.register_driver :chrome_headless do |app|
  chrome_capabilities = ::Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args': %w[no-sandbox headless disable-gpu window-size=1400,1400]
    }
  )
  if ENV['HUB_URL']
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: ENV['HUB_URL'],
      capabilities: chrome_capabilities
    )
  else
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      capabilities: chrome_capabilities
    )
  end
end

SimpleCov.start 'rails' do
  add_filter 'jobs'
  add_filter 'mailers'
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each, type: :system) do
    driven_by :chrome_headless

    Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:3000"
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3000
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

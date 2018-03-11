
=begin
RSpec.configure do |config|
  #[...other conf...]
 
  config.before(:each) do
    Capybara.app_host = "http://localhost:#{Capybara.current_session.server.port}"
  end
 
  config.after(:each) do
    Capybara.reset_sessions!
    Capybara.use_default_driver
    Capybara.app_host = nil
  end
end
=end

RSpec.configure do |config|
  #[...other config...]
 
  config.before(:each) do
    if /selenium_remote/.match Capybara.current_driver.to_s
      ip = `/sbin/ip route|awk '/scope/ { print $9 }'`
      ip = ip.gsub "\n", ""
      Capybara.server_port = "3000"
      Capybara.server_host = ip
      Capybara.app_host = "http://#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
    end
  end
 
  config.after(:each) do
    Capybara.reset_sessions!
    Capybara.use_default_driver
    Capybara.app_host = nil
  end
end

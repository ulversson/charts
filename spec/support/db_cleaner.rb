RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do |example|
    DatabaseCleaner.start
    Charts::Cleaner.clear_all
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end 
end
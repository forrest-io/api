require 'curator'

Curator.configure(:mongo) do |config|
  config.database = "forrest"
  config.environment = "test"
  config.migrations_path = File.expand_path(File.dirname(__FILE__) + "/../../config/db/migrate")
  config.mongo_config_file = File.expand_path(File.dirname(__FILE__) + "/../../config/mongo.yml")
end

RSpec.configure do |config|
  config.before(:suite) do
    Curator.data_store.remove_all_keys
  end

  config.after(:each) do
    Curator.data_store.reset!
  end
end
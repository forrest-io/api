require 'curator'

Curator.configure(:mongo) do |config|
  config.database = "forrest"
  config.environment = "development"
  config.migrations_path = File.expand_path(File.dirname(__FILE__) + "/../db/migrate")
  config.mongo_config_file = File.expand_path(File.dirname(__FILE__) + "/mongo.yml")
end
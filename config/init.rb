raise 'Must define APP_ROOT constant' unless APP_ROOT
require 'config/curator'
Dir.glob(File.join(APP_ROOT, "app/**/*.rb")).each { |f| require f }

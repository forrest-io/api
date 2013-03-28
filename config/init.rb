raise 'Must define APP_ROOT constant' unless defined?(APP_ROOT)
ENV['RACK_ENV'] ||= 'development'
require 'config/curator'
Dir.glob(File.join(APP_ROOT, "app/**/*.rb")).each { |f| require f }

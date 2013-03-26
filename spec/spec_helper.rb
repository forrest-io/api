APP_ROOT = File.join(File.dirname(__FILE__), "..")
Dir.glob(File.join(APP_ROOT, "spec/support/**/*.rb")).each { |f| require f }

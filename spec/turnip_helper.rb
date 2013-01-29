require 'rest-client'
require 'json'

URL_PREFIX = 'http://api.forrest.dev'

Dir.glob(File.join(File.dirname(__FILE__),"acceptance/steps/**/*.rb")).each { |f| require f }
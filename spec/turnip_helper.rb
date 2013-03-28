require 'rest-client'
require 'json'

URL_PREFIX = ENV['URL_PREFIX'] || 'http://api.forrest.dev'

puts URL_PREFIX

Dir.glob(File.join(File.dirname(__FILE__),"acceptance/steps/**/*.rb")).each { |f| require f }
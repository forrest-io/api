APP_ROOT = File.dirname(__FILE__)

$LOAD_PATH.unshift(APP_ROOT)

require 'config/init'

run Forrest::API

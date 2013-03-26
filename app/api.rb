require 'app/endpoints/players_endpoint'

module Forrest
  class API < Grape::API
    mount PlayersEndpoint
  end
end
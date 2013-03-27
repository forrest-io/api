require 'spec_helper'
require 'rack/test'

describe PlayersEndpoint do
  include Rack::Test::Methods

  def app
    PlayersEndpoint
  end

  describe 'GET /players' do
    it 'returns a list of players' do
      PlayerRepository.save(Player.new(name: 'James'))
      get '/players'
      last_response.status.should == 200
      players = JSON.parse(last_response.body)
      players.first['name'].should == 'James'
    end
  end

  describe 'GET /players/:slug' do
    it 'returns a Player' do
      PlayerRepository.save(Player.new(name: 'James', slug: 'james'))
      get '/players/james'
      last_response.status.should == 200
      player = JSON.parse(last_response.body)
      player['name'].should == 'James'
    end

    it 'returns a 404 when Player does not exist' do
      get '/players/butters'
      last_response.status.should == 404
      response = JSON.parse(last_response.body)
      response['error'].should == "not found: butters"
    end
  end

  describe 'POST /players' do
    it 'creates a Player' do
      post '/players', name: 'James'
      last_response.status.should == 201
      last_response.headers["Location"].should == '/players/james'
    end

    it 'requires a :name' do
      post '/players'
      last_response.status.should == 400
      response = JSON.parse(last_response.body)
      response['error'].should == "missing parameter: name"
    end
  end

  describe 'PUT /players/:slug' do
    it 'defines a Player' do
      put '/players/james', name: 'James'
      last_response.status.should == 200

      get '/players/james'
      last_response.status.should == 200
    end

    it 'overwrites an existing Player with the same slug' do
      put '/players/james', name: 'James Ottaway', email: 'james@forrest.io'
      last_response.status.should == 200

      get '/players/james'
      player = JSON.parse(last_response.body)
      player['name'].should == 'James Ottaway'
      player['email'].should == 'james@forrest.io'

      put '/players/james', name: 'James'
      last_response.status.should == 200

      get '/players/james'
      player = JSON.parse(last_response.body)
      player['name'].should == 'James'
      player['email'].should == nil
    end

    it 'requires a :name' do
      put '/players/james'
      last_response.status.should == 400
      response = JSON.parse(last_response.body)
      response['error'].should == "missing parameter: name"
    end

    it 'requires a :slug' do
      put '/players', name: 'James'
      last_response.status.should == 405
    end
  end

  describe 'DELETE /players/:slug' do
    it 'deletes a Player' do
      PlayerRepository.save(Player.new(name: 'James', slug: 'james'))

      get '/players/james'
      last_response.status.should == 200

      delete '/players/james'
      last_response.status.should == 200

      get '/players/james'
      last_response.status.should == 404
    end

    it 'returns a 404 when Player does not exist' do
      delete '/players/james'
      last_response.status.should == 404

      response = JSON.parse(last_response.body)
      response['error'].should == "not found: james"
    end
  end
end
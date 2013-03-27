require 'grape'

class PlayersEndpoint < Grape::API
  format :json

  resource :players do
    desc 'Return all Players'
    get do
      PlayerRepository.all
    end

    desc 'Return a specific Player'
    get ':slug' do
      player = PlayerRepository.find_first_by_slug(params[:slug])
      error! "not found: #{params[:slug]}", 404 if player.nil?
      player
    end

    desc 'Create a new Player'
    params do
      requires :name, type: String
      optional :email, type: String
    end
    post do
      player = Player.new(params)
      PlayerRepository.save(player)
      header 'Location', "/players/#{player.slug}"
    end

    desc 'Define a Player'
    params do
      requires :name, type: String
      optional :email, type: String
    end
    put ':slug' do
      player = Player.new(params)
      PlayerRepository.save(player)
    end

    desc 'Delete a Player'
    delete ':slug' do
      player = PlayerRepository.find_first_by_slug(params[:slug])
      error! "not found: #{params[:slug]}", 404 if player.nil?
      PlayerRepository.delete(player)
    end
  end
end

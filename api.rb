require 'sinatra'

set :erb, :content_type => 'application/json'

before { @prefix = ENV["URL_PREFIX"] }

get '/players' do
  erb :players
end

get '/players/:name' do
  erb :"players/#{params[:name]}"
end

get '/results' do
  erb :results
end

get '/results/:id' do
  erb :"results/#{params[:id]}"
end

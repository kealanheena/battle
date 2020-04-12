require "sinatra"
require "./lib/player"
require "./lib/game"

class Battle < Sinatra::Base

  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new((params[:player_1]), (params[:player_2]))
    redirect '/play'
  end

  get '/play' do
    @player_1, @player_2 = $game.player_1, $game.player_2
    @game = $game
    redirect :win if @player_2.dead?
    erb :play
  end

  get '/attack' do
    @player_1, @player_2 = $game.player_1, $game.player_2
    @game = $game
    @game.attack
    redirect :play
  end

  get '/win' do
    @player_1 = $game.player_1
    erb :win
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
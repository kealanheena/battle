require "sinatra"
require "./lib/player"
require "./lib/game"

class Battle < Sinatra::Base

  enable :sessions

  before '/play*' do
    @game = Game.instance
    @player_1, @player_2 = @game.player_1, @game.player_2
  end
  
  get '/' do
    erb :index
  end

  post '/names' do
    Game.new(params[:player_1], params[:player_2])
    redirect :play
  end

  get '/play' do
    @game.poison_damage
    redirect '/play/winner' if @player_1.dead? || @player_2.dead?
    erb :play
  end

  get '/play/attack' do
    @game.attack
    redirect :play
  end

  get '/play/poison' do
    @game.poison_attack
    redirect :play
  end

  get '/play/winner' do
    erb :winner
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

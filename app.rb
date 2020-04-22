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
    redirect '/play/winner' if @game.over?
    @game.poison_damage
    erb :play
  end

  get '/play/attack' do
    @game.attack
    redirect :play
  end

  get '/play/poison' do
    @game.special_attack('poisoned')
    redirect :play
  end

  get '/play/electrocute' do
    @game.special_attack('immobilised')
    redirect :play
  end

  get '/play/sleep' do
    @game.sleep_spell
    redirect :play
  end

  get '/play/heal' do
    @game.heal_spell
    redirect :play
  end

  get '/play/winner' do
    erb :winner
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

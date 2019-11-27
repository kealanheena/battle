require "sinatra"

class Battle < Sinatra::Base

  attr_reader :player_1

  get "/" do
    @player_1 = params[:player_1]
    @player_2 = params[:player_2]
    puts params
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
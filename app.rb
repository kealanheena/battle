require "sinatra"

class Battle < Sinatra::Base

  get "/" do
    erb(:index)
  end

  post "/battle" do
    @player_1, @player_2 = params[:player_1], params[:player_2]
    erb(:battle)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
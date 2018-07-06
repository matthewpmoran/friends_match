require 'bundler'
Bundler.require
require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  #Post route
  post '/game' do
    #Create variable for userGuess and set equal to userGuess param hash from index.erb
    userGuess = params[:userGuess]
    computerGuess = computer_turn
    puts computerGuess
    #Create instance variable for results, set equal to comparison result from the compare method in sample_model.rb
    @results = compare(userGuess, computerGuess)
    
    #Display results page results.erb (in the views folder)
    erb :results
  end
  
end

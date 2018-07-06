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
  
  post '/gamestart' do
     #Create variable for userGuess and set equal to userGuess param hash from index.erb
    @userGuess = params[:userGuess]
    @computerGuess = computer_turn_api_first_turn(@userGuess)
    puts @computerGuess
    
    #Create instance variable for results, set equal to comparison result from the compare method in sample_model.rb
    @results = compare(@userGuess, @computerGuess)
    
    #Display results page results.erb (in the views folder)
    erb :gamestart
  end   
  
  post '/gameplay/?:previousUserGuess?/?:previousComputerGuess?' do
    @userGuess = params[:userGuess]
    @previousUserGuess = params[:previousUserGuess]
    @previousComputerGuess = params[:previousComputerGuess]
    @computerGuess = computer_turn_api(@previousUserGuess,@previousComputerGuess)
    @results = compare(@userGuess, @computerGuess)
    erb :gameplay
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
    erb :index
  end
  
end

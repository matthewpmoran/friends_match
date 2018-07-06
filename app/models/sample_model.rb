#Create method for computer to take a turn and make a guess
def computer_turn
    
    #Create array for Friends cast members
    friendsCast = ["Ross", "Chandler", "Joey", "Rachel", "Monica", "Pheobe"]
    #Create variable for computer guess value and set equal to random selection from the friendscast array
    computerGuess = friendsCast.sample
    return computerGuess
end

def computer_turn_api_first_turn(userGuess)
   data = []
   while data == []
       wordseeds = ["cat", "tree","dog", "house", "boat", "sugar", "car", "bike", "star", "laptop", "table", "chair", "plant", "burrito", "guacamole", "smile", "watch", "grandma"]
       randomword = wordseeds.sample
       apiendpoint = 'https://api.datamuse.com/words?rel_trg=' + randomword
       data = HTTParty.get(apiendpoint)
       data = data.to_s
       data = JSON.parse(data)
   end
   computerGuess = data[rand(12)]["word"]

   return computerGuess
end

def computer_turn_api(userGuess, computerGuess)
    userGuess = userGuess.to_s
    computerGuess = computerGuess.to_s
   apiendpoint = 'https://api.datamuse.com/words?rel_trg=' + userGuess + '&rel_trg=' +computerGuess
   data = HTTParty.get(apiendpoint) 
   data = data.to_s
   data = JSON.parse(data)
   if data == [] 
       
       secondComputerGuess = computer_turn_api_first_turn(userGuess)

   else
        secondComputerGuess = data[0]["word"]
   end
   puts apiendpoint
   puts data
   return secondComputerGuess
end

def compare(userGuess, computer_turn)
    if userGuess.capitalize == computer_turn.capitalize
        @imgurl = "https://media.giphy.com/media/dh2XvZthDl7ag/giphy.gif"
        return "Minds melded! The computer guesssed #{computer_turn}. You guessed #{userGuess}. Play again? <a href=\"/\">Yes</a>"
    else
        return "Losers. Your minds aren't melded. The computer guesssed #{computer_turn}. You guessed #{userGuess}."
    end
end

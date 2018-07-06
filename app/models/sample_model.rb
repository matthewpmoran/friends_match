#Create method for computer to take a turn and make a guess
def computer_turn
    
    #Create array for Friends cast members
    friendsCast = ["Ross", "Chandler", "Joey", "Rachel", "Monica", "Pheobe"]
    #Create variable for computer guess value and set equal to random selection from the friendscast array
    computerGuess = friendsCast[rand(6)]
    return computerGuess
end

def compare(userGuess, computer_turn)
    if userGuess == computer_turn
        return "Minds melded! The computer guesssed #{computer_turn}. You guessed #{userGuess}."
    else
        return "Losers. Your minds aren't melded. The computer guesssed #{computer_turn}. You guessed #{userGuess}."
    end
end
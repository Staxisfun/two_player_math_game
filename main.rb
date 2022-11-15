
require "./players"
require "./question"

  
def start
  puts "Welcome to the thrilling ruby math game! This game requires two willing victims."
  askQuestions  
end

@player1 = Players.new("Player1")
@player2 = Players.new("Player2")

@count = 0   

def askQuestions
  @count += 1
  if @count % 2 != 0 && @player1.alive? && @player2.alive?
    question = Questions.new
    
    if (@count != 1)
      puts '----- NEW TURN -----'
    end
    puts "Player 1: #{question.display}"
    print '> '
    answer = gets.chomp
    
    if answer.to_i == question.answer
      puts "Player 1: Yes! that is correct."
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"       
    else 
      @player1.lives -= 1
      puts "Player 1:  No! You are incorrect!"
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
    askQuestions
  
  elsif @count % 2 == 0 && @player1.alive? && @player2.alive?
    question = Questions.new
    puts '----- NEW TURN -----'
    puts "Player 2: #{question.display}"
    print '> '
    answer = gets.chomp
    
    if answer.to_i == question.answer
      puts "Player 2: Yes! that is correct."
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    
    else 
      @player2.lives -= 1
      puts "Player 2:  No! You are incorrect!"
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    #   puts '----- NEW TURN -----'
    end
    askQuestions
  
  else 
    if !(@player1.alive?)
      puts "Player 2 wins the game! score of #{@player2.lives}/3"
      puts '----- GAME OVER -----'
      puts 'Good bye!'
    else
      puts "Player 1 wins the game! score of #{@player1.lives}/3"
      puts '----- GAME OVER -----'
      puts 'Farewell!' 
    end   
  end
end  

start
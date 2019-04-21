require './question'

class Turn

  attr_accessor :current_player, :players

  def initialize(players) 
    @players = players
    @current_player = @players[0]
  end

  def next_player
    if @current_player == @players[0]
      @current_player = @players[1]
    else 
      @current_player = @players[0]
    end
    @current_player
  end

  def next_question
    puts "--- NEW TURN ---"
    current_question = Question.new
    puts "#{current_player.name}: #{current_question.question}"
    answer = gets.chomp.to_i
      if current_question.correct? answer
        puts "#{current_player.name}: YES! You are correct."
      else 
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
  end

end
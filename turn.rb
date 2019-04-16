require './question'

class Turn

  def initialize(players) 
    @players = players
    @player_index = 0
  end

  def current_player
    @players[@player_index]
  end

  def next_player
    if @player_index == 0
      @player_index = 1
    else 
      @player_index = 0
    end
    @players[@player_index]
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
require './turn'
require './player'

class Game

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @player_index = 0
    @turn = Turn.new(@players)
  end

  def summary
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def game_over?
    @player1.dead? || @player2.dead?
  end

  def end_game
    winner = @players.select{|player| !player.dead?}.first
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "--- GAME OVER ---"
  end

  def run
    until (game_over?)
      @turn.next_question
      current_player = @turn.next_player
      summary
      end
    end_game
  end  

end
class Start
  attr_accessor :player1, :player2
  def initialize
    @player1 = Player.new("Player One")
    @player2 = Player.new("Player Two")
    @players = [@player1, @player2]
    @turn = Turn.new(@players)
    @question = Question.new
  end

  def run
    while !end?
      puts "#{@turn.current_player.name} : #{@question.ask_question}"
      print "Enter your answer: "
      input = gets.chomp.to_i
      if @question.check_answer(input)
        puts "That's Correct!"
      else
        puts "Nope! That's wrong!"
        @turn.current_player.lose_life
        if @turn.current_player.lives != 0
          puts "----- NEW TURN -----"
        end
      end
      @question = Question.new
      @turn.next_game
    end
    end_statement
  end

  def end?
    @player1.lives == 0 || @player2.lives == 0
  end

  def end_statement
    puts "#{@turn.current_player.name} WINS with a score of #{@turn.current_player.lives}/3"
    puts "----- GAME OVER -----"
  end
end


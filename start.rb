class Start
  attr_accessor :player1, :player2
  def initialize
    @player1 = Player.new("Player One")
    @player2 = Player.new("Player Two")
    @players = [@player1, @player2]
    @current_player_indice = 0
    @question = Question.new
  end

  def run
    while !end?
      puts "#{current_player.name}  : #{@question.ask_question}"
      print "Enter your answer: "
      input = gets.chomp.to_i
      if @question.check_answer(input)
        puts "That's Correct!"
      else
        puts "Nope! That's wrong!"
        current_player.lose_life
        if current_player.lives != 0
          puts "----- NEW TURN -----"
        end
      end
      summary
      puts "-----------------"
      @question = Question.new
      next_player
      current_player
    end
    puts "#{current_player.name} WINS with a score of #{current_player.lives}/3"
    puts "----- GAME OVER -----"
  end

  def current_player
    @players[@current_player_indice]
  end

  def next_player
    @current_player_indice = (@current_player_indice + 1) % @players.size
  end

  def end?
    @player1.lives == 0 || @player2.lives == 0
  end

  def summary
    @players.map{|player| puts "#{player.name}, #{player.lives}/3"}
  end

end


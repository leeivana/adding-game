class Turn
  attr_accessor :current_player_indice
  attr_reader :players

  def initialize(arr)
    @players = arr
    @current_player_indice = 0
  end

  def current_player
    @players[@current_player_indice]
  end

  def next_player
    @current_player_indice = (@current_player_indice + 1) % @players.size
  end

  def next_game
    next_player
    current_player
    @players.map{|player| puts "#{player.name}, #{player.lives}/3"}
    puts "---------------------"
  end

end

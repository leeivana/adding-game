# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pry'
require './question'
require './player'
require './start'
require './turn'

## Your test code can go here

new_game = Start.new()
# while end? do
#   puts "running"
#   new_game.player1.lives = 0
# end
# puts "-----GAME OVER-----"
new_game.run
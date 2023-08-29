require "./tictactoe.rb"

include TicTacToe

game = Game.new [Player.new("X"), Player.new("O")]
game.play

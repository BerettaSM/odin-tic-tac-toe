require "./tictactoe.rb"

include TicTacToe

game = Game.new [HumanPlayer.new("X"), HumanPlayer.new("O")]
game.play

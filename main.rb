require "./tictactoe.rb"
require "./helpers.rb"

include TicTacToe

def game
    Game.new([HumanPlayer.new("X"), HumanPlayer.new("O")]).play
    sleep 3
end

game

loop do
    clear_console

    puts "Play another game? [y/n] "
    answer = gets.chomp
    
    break if answer.downcase[0] == 'n'

    game
end

clear_console
puts "Thank you for playing!"

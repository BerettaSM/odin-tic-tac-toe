module TicTacToe

    class Game
        def initialize players
            @board = Board.new

            @player1, @player2 = players
        end

        def play
            @board.show
            player = Player.new "X"
            player.execute_turn @board
        end
    end

    class Board
        def initialize
            @cells = Array.new 9, nil
        end

        def show
            separator = " | "
            rows = @cells.each_slice(3).to_a
            
            rows.each_with_index do |row, row_index|
                puts "  -----------"
                print " | "
                row.each_with_index do |cell, cell_index|
                    print cell ? cell : row_index * 3 + cell_index + 1
                    print separator
                end
                puts ""
            end
            puts "  -----------"
        end
    end

    class Player
        attr_reader :marker

        def initialize marker
            @marker = marker
        end

        def execute_turn board
            raise NotImplementedError
        end
    end
end

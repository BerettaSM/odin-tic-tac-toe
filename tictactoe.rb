module TicTacToe

    class Game
        def initialize
            @board = Board.new
        end

        def play
            @board.show
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

end

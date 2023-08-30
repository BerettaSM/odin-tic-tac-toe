require "./helpers.rb"

module TicTacToe
    LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

    class Game
        def initialize players
            @board = Board.new

            @player_1, @player_2 = players
            @current_player = @player_1
        end

        def play
            loop do
                @board.show

                player = next_player
                chosen_pos = get_player_input player

                @board.attribute_position chosen_pos, player.marker

                if @board.is_winner? player.marker
                    puts "#{player.marker} has won!"
                    break
                end

                if !@board.has_empty_positions?
                    puts "No more positions."
                    break
                end
            end
            puts "Thanks for playing!"
        end

        private

        def next_player
            cur = @current_player
            @current_player = cur.equal?(@player_2) ? @player_1 : @player_2
            cur
        end

        def get_player_input player
            loop do
                chosen_position = player.execute_turn @board.cells
                
                if !is_integer?(chosen_position) || !is_valid_position(chosen_position.to_i)
                    puts "Invalid position."
                    next
                end

                if @board.is_position_taken? chosen_position.to_i
                    puts "Position already taken."
                    next
                end

                return chosen_position.to_i
            end
        end

        def is_valid_position play
            play > 0 && play < 10
        end
    end

    class Board
        def initialize
            @cells = Array.new 10, nil
        end

        def cells
            @cells.clone
        end

        def attribute_position position, marker
            @cells[position] = marker
        end

        def is_position_taken? pos
            cells[pos] != nil
        end

        def has_empty_positions?
            @cells.slice(1..-1).any? nil
        end

        def is_winner? marker
            LINES.each do |line|
                if line.all? { |pos| @cells[pos] == marker }
                    return true
                end
            end
            false
        end

        def show
            clear_console
            separator = " | "
            dashed_line = "  -----------"
            rows = @cells.slice(1..-1).each_slice(3).to_a
            
            rows.each_with_index do |row, row_index|
                puts dashed_line
                print separator
                row.each_with_index do |cell, cell_index|
                    print cell ? cell : row_index * 3 + cell_index + 1
                    print separator
                end
                puts ""
            end
            puts dashed_line
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

    class HumanPlayer < Player
        def execute_turn board
            gets.chomp
        end
    end
end

class TicTacToe
    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        index = user_input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        (0..8) === index && !position_taken?(index)
    end

    def turn
        puts "Please enter 1-9"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            puts "Move invalid"
            turn
        end
    end

    def turn_count
        9 - @board.count(" ")
    end

    def current_player
        turn_count % 2 == 1 ? "O" : "X"
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[2]] != " "
                return combo
            end
        end
        false
    end

    def full?
        9 - @board.count(" ") == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || full?
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        while !over?
            turn
            break if draw?
        end

        if (won?)
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

end

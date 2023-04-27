class ConnectFour

  attr_reader :game_board
  
  def initialize(game_board = Array.new(7, Array.new(6, ' ')))
    @game_board = game_board
    @game_rows = columns_to_rows(@game_board)
    @game_diagonals = make_diagonals
    @current_player = 'X'
  end

  def play_game
    # puts Introduction
    print_board
    while !game_over?
      place_piece(get_input)
      # switch_player
      puts print_board
    end
    puts "Congratulations! #{@current_player} Wins!"
  end

  def get_input
    puts "Into which column will you drop your piece? Input a number between 1 and 7!"
    loop do
      user_input = gets.chomp
      verified_number = (user_input.to_i - 1) if user_input.match?(/^[1-7]$/)
      return verified_number if verified_number

      puts "That's not a valid character, try again with a number between 1 and 7."
    end
  end

  def place_piece(column, piece = @current_player)
    @game_board[column][stack_column(column)] = piece
  end

  def stack_column(column)
    @game_board[column].find_index { |el| el == ' '}
  end

  def game_over?
    #check columns for win
    @game_board.each do |column|
      return true if winning_line?(column)
    end

    #check rows for win
    @game_rows.each do |row|
      return true if winning_line?(row)
    end

    #check diagonals for win
    @game_diagonals.each do |diagonal|
      return true if winning_line?(diagonal)
    end

    false
  end

  def winning_line?(line)
    line.each_cons(4) do |window|
      return true if window.all? { |el| el == 'X'} || window.all? { |el| el == 'O' }
    end
    false
  end

  def columns_to_rows(game_board)
    num_rows = game_board[0].size
    num_cols = game_board.size
    row_board = Array.new(num_rows) { Array.new(num_cols) }
  
    num_rows.times do |row|
      num_cols.times do |col|
        row_board[row][col] = game_board[col][row]
      end
    end
  
    return row_board
  end
  
  def make_diagonals(game_board = @game_board)

    #bottom left to top right
    diagonals = []
    
    (3..game_board.length - 1).each do |col|
      diagonal = []
      row = 0
      until col < 0 do
        diagonal << game_board[col][row]
        row += 1
        col -=1
        # p diagonal
      end
      diagonals << diagonal.compact
    end
    
    #past game_board[6] to top right
    2.times do |base|
      diagonal = []
      col = 6
      until col < 0 do
        diagonal << game_board[col][base + 1]
        base += 1
        col -= 1
      end
      diagonals << diagonal.compact
    end

    #top left to bottom right
    (0..3).each do |col|
      diagonal = []
      row = 0
      until col > 6 do
        diagonal << game_board[col][row]
        row += 1
        col += 1
      end
      diagonals << diagonal.compact
    end

    #past game_board[1] towards bottom right
    2.times do |base|
      diagonal = []
      col = 0
      until col > 4 do
        diagonal << game_board[col][base + 1]
        col += 1
        base += 1
      end
      diagonals << diagonal.compact
    end 
    
    diagonals
  end


  def print_board
    board_string = ""
    columns_to_rows(@game_board).reverse_each do |row|
      row_string = "|"
      row.each do |el|
        row_string << "#{el}|"
      end
      board_string << "#{row_string}\n"
    end
    board_string
  end
  
end
  
  
# diagonal_board = [['X', 'O', ' ', ' ', ' ', ' '],
#                       ['O', 'X', ' ', ' ', ' ', ' '],
#                       ['O', 'O', 'X', ' ', ' ', ' '],
#                       ['X', 'O', 'X', ' ', ' ', ' '],
#                       ['O', 'X', 'O', ' ', ' ', ' '],
#                       ['X', 'X', ' ', ' ', ' ', ' '],
#                       [' ', ' ', ' ', ' ', ' ', ' ']]
# test = ConnectFour.new(diagonal_board)
# test.play_game

  



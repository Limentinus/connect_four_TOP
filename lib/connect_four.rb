class ConnectFour
  
  def initialize(game_board = [['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', '']])
    @game_board = game_board
    @game_rows = columns_to_rows(@game_board)
  end

  def place_piece(column, piece)
    @game_board[column][stack_column(column)] = piece
  end

  def stack_column(column)
    @game_board[column].find_index { |el| el.empty?}
  end

  def game_over?
    #check rows for win
    @game_rows.each do |row|
      return true if winning_line?(row)
      false
    end
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
  
end

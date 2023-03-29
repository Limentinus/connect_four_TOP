class ConnectFour
  
  def initialize(game_board = { col1: ['', '', '', '', '', ''],
                                col2: ['', '', '', '', '', ''],
                                col3: ['', '', '', '', '', ''],
                                col4: ['', '', '', '', '', ''],
                                col5: ['', '', '', '', '', ''],
                                col6: ['', '', '', '', '', ''],
                                col7: ['', '', '', '', '', '']})
    @game_board = game_board
  end

  def place_piece(column, piece)
    @game_board[column][stack_column(column)] = piece
  end

  def stack_column(column)
    @game_board[column].find_index { |el| el.empty?}
  end

  def game_over?
  end
end
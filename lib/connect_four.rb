class ConnectFour
  
  def initialize(game_board = [['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', ''],
                               ['', '', '', '', '', '']])
    @game_board = game_board
  end

  def place_piece(column, piece)
    @game_board[column][stack_column(column)] = piece
  end

  def stack_column(column)
    @game_board[column].find_index { |el| el.empty?}
  end

  # def game_over?
  #   if @game_board.each_value {}
  # end

   # def make_rows(board)
  #   transposed_board = []
  #   board[col1].length.times do |row|
  #     transposed_row = []
  #     board.each do |col, values|
  #       transposed_row << values[row]
  #     end
  #     transposed_board << transposed_row
  #   end
  #   transposed_board
  # end
end

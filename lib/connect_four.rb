class ConnectFour

  def initialize
    @game_board = {col1: ['', '', '', '', '', ''],
                   col2: ['', '', '', '', '', ''],
                   col3: ['', '', '', '', '', ''],
                   col4: ['', '', '', '', '', ''],
                   col5: ['', '', '', '', '', ''],
                   col6: ['', '', '', '', '', ''],
                   col7: ['', '', '', '', '', '']}
  end

  def place_piece(column, piece)
    @game_board[column][0] = piece
  end
end
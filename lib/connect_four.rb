class ConnectFour

  attr_reader :game_board
  
  def initialize(game_board = Array.new(7, Array.new(6, '')))
    @game_board = game_board
    @game_rows = columns_to_rows(@game_board)
    @game_diagonals = make_diagonals
  end

  def place_piece(column, piece)
    @game_board[column][stack_column(column)] = piece
  end

  def stack_column(column)
    @game_board[column].find_index { |el| el.empty?}
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


  
  
end
  
  
diagonal_board = [['X', 'O', '', '', '', ''],
                      ['O', 'X', '', '', '', ''],
                      ['O', 'O', 'X', 'X', '', ''],
                      ['X', 'O', 'X', '', '', ''],
                      ['O', 'X', 'O', '', '', ''],
                      ['X', 'X', '', '', '', ''],
                      ['', '', '', '', '', '']]
test = ConnectFour.new(diagonal_board)
# p test.game_board[0][1]
p test.make_diagonals
  



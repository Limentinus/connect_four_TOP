require_relative '../lib/connect_four'

describe ConnectFour do
  describe '#place_piece' do
    context 'when a piece and a column is given' do
      subject(:place_game) { described_class.new }

      it 'updates the game board hash' do
        place_game.place_piece(5, 'X')
        game_board = place_game.instance_variable_get(:@game_board)
        expect(game_board[5][0]).to eq('X')
      end
    end

    context 'when a piece is already in the column' do
      filled_board = [['X', '', '', '', '', ''],
                      ['O', 'X', 'O', '', '', ''],
                      ['', '', '', '', '', ''],
                      ['', '', '', '', '', ''],
                      ['', '', '', '', '', ''],
                      ['', '', '', '', '', ''],
                      ['', '', '', '', '', '']]
      subject(:filled_game) { described_class.new(filled_board) }
      it 'updates the place above the full space' do
        filled_game.place_piece(0, 'O')
        game_board = filled_game.instance_variable_get(:@game_board)
        expect(game_board[0][1]).to eq('O')
      end

      it 'updates the place if there are multiple full spaces in the column' do
        filled_game.place_piece(1 , 'X')
        game_board = filled_game.instance_variable_get(:@game_board)
        expect(game_board[1][3]).to eq('X')
      end
    end
  end

  describe '#game_over?' do
    context 'when four game pieces connect in a row' do
      row_board = [['X', 'O', '', '', '', ''],
                   ['O', 'X', 'O', '', '', ''],
                   ['O', 'X', 'O', '', '', ''],
                   ['X', 'O', 'O', '', '', ''],
                   ['O', 'X', 'O', '', '', ''],
                   ['', '', '', '', '', ''],
                   ['', '', '', '', '', '']]
      subject(:row_game) { described_class.new(row_board)}

      it 'returns true' do
        expect(row_game.game_over?).to eq(true)
      end
    end

    context 'when four game pieces in a column connect' do
      column_board = [['X', 'O', '', '', '', ''],
                   ['O', 'X', '', '', '', ''],
                   ['O', 'X', '', '', '', ''],
                   ['X', 'O', 'O', '', '', ''],
                   ['O', 'X', 'O', '', '', ''],
                   ['X', 'X', 'X', 'X', '', ''],
                   ['', '', '', '', '', '']]
      subject(:column_game) { described_class.new(column_board)}
      it 'returns true' do
        expect(column_game.game_over?).to eq(true)
      end
    end

    context 'when four game pieces in a diagonal connect' do
      diagonal_board = [['X', 'O', '', '', '', ''],
                   ['O', 'X', '', '', '', ''],
                   ['O', 'O', 'X', 'X', '', ''],
                   ['X', 'O', 'X', '', '', ''],
                   ['O', 'X', 'O', '', '', ''],
                   ['X', 'X', '', '', '', ''],
                   ['', '', '', '', '', '']]
      subject(:diagonal_game) { described_class.new(diagonal_board) }

      it 'returns true' do
        expect(diagonal_game.game_over?).to eq(true)
      end
    end
  end

  describe '#winning_line?' do
    subject(:game_lines) { described_class.new }
    context 'when a line with four or more of the same pieces in row is given' do
      line = ['O', 'X', 'X', 'X', 'X', '', '']
      it 'returns true' do
        expect(game_lines.winning_line?(line)).to eq(true)
      end
    end

    context 'when no four connect' do
      line = ['O', 'X', 'X', 'O', 'X', '', '']
      it 'returns false' do
        expect(game_lines.winning_line?(line)).to eq(false)
      end
    end
  end

  describe '#make_diagonals' do
    diagonal_board = [['X', 'O', '', '', '', ''],
                      ['O', 'X', '', '', '', ''],
                      ['O', 'O', 'X', 'X', '', ''],
                      ['X', 'O', 'X', '', '', ''],
                      ['O', 'X', 'O', '', '', ''],
                      ['X', 'X', '', '', '', ''],
                      ['', '', '', '', '', '']]
    subject(:diagonals_game) { described_class.new(diagonal_board)}
    context 'when given the game_board' do
      it 'returns an array of all the diagonals that are at least 4 spaces large' do
        diagonals = [['X', 'O', '', ''],
                     ['O', 'O', 'X', '', ''],
                     ['X', 'X', 'X', 'X', '', ''],
                     ['', 'X', 'O', '', '', ''],
                     ['', '', '', '', ''],
                     ['', '', '', ''],
                     ['X', 'X', 'X', '', '', ''],
                     ['O', 'O', 'X', '', '', ''],
                     ['O', 'O', 'O', '', ''],
                     ['X', 'X', '', ''],
                     ['O', '', 'X', '', ''],
                     ['', '', '', '']]
        
        expect(diagonals_game.make_diagonals).to eq(diagonals)
      end
    end
  end

  describe '#print_board' do
    context 'when called' do
      print_board = [['X', 'O', '', '', '', ''],
                    ['O', 'X', '', '', '', ''],
                    ['O', 'O', 'X', 'X', '', ''],
                    ['X', 'O', 'X', '', '', ''],
                    ['O', 'X', 'O', '', '', ''],
                    ['X', 'X', '', '', '', ''],
                    ['', '', '', '', '', '']]
      subject(:print_game) { described_class.new(print_board) }
      it 'prints the board' do
        board_output = "| | | | | | | |\n
        | | | | | | | |\n
        | | | | |X| | |\n
        | | |X|X|O| | |\n
        |O|X|O|O|X|X| |\n
        |X|O|O|X|O|X| |\n"
        expect(subject.print_board).to output(board_output).to_stdout
      end
    end
  end

end

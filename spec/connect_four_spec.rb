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
        filled_game.place_piece(0 , 'O')
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
  end

  describe '#check_for_winner' do
    subject(:game_lines) { described_class.new }
    context 'when a line with four or more of the same pieces in row is given' do
      line = ['O', 'X', 'X', 'X', 'X', '', '']
      it 'returns winner' do
        expect(game_lines.check_for_winner(line)).to eq('X')
      end
    end
  end

end
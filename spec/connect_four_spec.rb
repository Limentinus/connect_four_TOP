require_relative '../lib/connect_four'

describe ConnectFour do
  describe '#place_piece' do
    context 'when a piece and a column is given' do
      subject(:place_game) { described_class.new }

      it 'updates the game board hash' do
        place_game.place_piece(:col6, 'X')
        game_board = place_game.instance_variable_get(:@game_board)
        expect(game_board[:col6][0]).to eq('X')
      end
    end

    context 'when a piece is already in the column' do
      filled_board = {col1: ['X', '', '', '', '', ''],
                      col2: ['O', 'X', 'O', '', '', ''],
                      col3: ['', '', '', '', '', ''],
                      col4: ['', '', '', '', '', ''],
                      col5: ['', '', '', '', '', ''],
                      col6: ['', '', '', '', '', ''],
                      col7: ['', '', '', '', '', '']}
      subject(:filled_game) { described_class.new(filled_board) }
      it 'updates the place above the full space' do
        filled_game.place_piece(:col1, 'O')
        game_board = filled_game.instance_variable_get(:@game_board)
        expect(game_board[:col1][1]).to eq('O')
      end

      it 'updates the place if there are multiple full spaces in the column' do
        filled_game.place_piece(:col2, 'X')
        game_board = filled_game.instance_variable_get(:@game_board)
        expect(game_board[:col2][3]).to eq('X')
      end
    end
  end

end
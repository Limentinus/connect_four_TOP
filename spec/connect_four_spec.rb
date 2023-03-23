require_relative '../lib/connect_four'

describe ConnectFour do
  describe '#place_piece' do
    context 'when a piece and a column is given' do
      subject(:place_game) { described_class.new }

      it 'updates the game board hash' do
        place_game.place_piece('X', 6)
        game_board = place_game.instance_variable_get(:@game_board)
        expect(game_board[:col6][0]).to eq('X')
      end
    end
  end

end
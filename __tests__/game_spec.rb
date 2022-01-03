require './game'

describe Game do
  context 'Creating an instance of a Game' do
    it 'should create a new instace of a Game with Item class as Parent' do
      expect(Game.superclass).to eq(Item)
    end
    it 'should create a new instace of a Game with a last played date' do
      game = Game.new('2015-03-03', true, '2016-10-10')
      expect(game.last_played_at).to eq('2016-10-10')
    end
    it 'should return false when try to archive the Game because the release date is less than 10 years' do
      game = Game.new('2015-03-03', true, '2016-10-10')
      expect(game.can_be_archived?).to eq(false)
    end
    it 'should return false when try to archive the Game because it was played earlier than 2 years' do
      game = Game.new('2010-03-03', true, '2020-10-10')
      expect(game.can_be_archived?).to eq(false)
    end
    it 'should return true when try to archive the Game' do
      game = Game.new('2010-03-03', true, '2011-10-10')
      expect(game.can_be_archived?).to eq(true)
    end
  end
end

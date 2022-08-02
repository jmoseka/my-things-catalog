require './classes/game'

describe Game do
  before :each do
    @game = Game.new(true, '2022', '2021')
  end

  context 'test initialize method' do
    it 'check instance of a Game' do
      expect(@game).to be_an_instance_of Game
    end

    it 'check multiplayer instance variable' do
      expect(@game.multiplayer).to eq true
    end

    it 'check last_played_at instance variable' do
      expect(@game.last_played_at.to_s).to eq '2022'
    end
  end

  context 'check can_be_archived? method' do
    it 'should return true ' do
      game = Game.new(true, 2015, 2010)
      result = game.send(:can_be_archived?)
      expect(result).to be_truthy
    end
  end
end

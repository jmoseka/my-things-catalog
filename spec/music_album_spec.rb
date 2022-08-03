require 'date'
require_relative '../classes/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new(2002)
  end

  it 'music should be an instance of Music class' do
    expect(@music).to be_an_instance_of MusicAlbum
  end

  it 'music should be an archived' do
    expect(@music.can_be_archived?).to be true
  end
end

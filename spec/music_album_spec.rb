require 'date'
require_relative '../classes/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new 'name', Date.parse('2010-12-05'), true
  end

  it 'music should be an instance of Music class' do
    expect(@music).to be_an_instance_of MusicAlbum
  end
end

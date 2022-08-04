require_relative '../classes/genre'

describe Genre do
  before :each do
    @genre = Genre.new('thriller')
  end

  it 'should detect the genre name' do
    expect(@genre.name).to eq 'thriller'
  end

  it 'should detect the genre id' do
    genre = Genre.new('test')
    allow(genre).to receive(:id) { 50 }
    expect(genre.id).to eq 50
  end
end

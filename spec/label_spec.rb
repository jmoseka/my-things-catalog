require_relative '../classes/label'
require_relative '../classes/book'

describe 'Label object' do
  context 'should create an instance of Label class' do
    label = Label.new('Cinderella', 'Purple')
    book = Book.new('Cindy Lohan', 'good', '2022/02/12')

    it 'takes three parameters and returns a Label object' do
      expect(label.class) == Label
    end

    it 'returns correct values of label object instance variables' do
      expect(label.title).to eq 'Cinderella'
      expect(label.color).to eq 'Purple'

      expect(label.title).not_to eq 'Cindy'
      expect(label.color).not_to eq 'Red'
    end

    it 'should add an item to label class item array' do
      label.add_item(book)
      expect(label.items.length).to eq 1
    end
  end
end

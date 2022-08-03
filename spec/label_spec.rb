require_relative '../classes/label'

describe 'Label object' do
  context 'should create an instance of Label class' do
    label = Label.new('Cinderella', 'Purple')

    it 'takes three parameters and returns a Label object' do
      expect(label.class) == Label
    end

    it 'returns correct values of label object instance variables' do
      expect(label.title).to eq 'Cinderella'
      expect(label.color).to eq 'Purple'

      expect(label.title).not_to eq 'Cindy'
      expect(label.color).not_to eq 'Red'
    end
  end
end

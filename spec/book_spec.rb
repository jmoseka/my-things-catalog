require_relative '../classes/book.rb'

describe 'Book object' do
  context 'should create an instance of Book class' do
    book = Book.new('Cindy Lohan', 'good', '2022/02/12')

    it 'takes three parameters and returns a Book object' do
      expect(book.class) == Book
    end

    it 'returns correct values of book object instance variables' do
      expect(book.publisher).to eq 'Cindy Lohan'
      expect(book.cover_state).to eq 'good'
      expect(book.publish_date).to eq '2022/02/12'

      expect(book.publisher).not_to eq 'Cindy'
      expect(book.cover_state).not_to eq 'Go'
      expect(book.publish_date).not_to eq '2021/02/12'
    end

    it 'checks the availability of Book class method/s' do
      # checks if add_rental functions exist or not
      expect(Book.instance_methods(false).include?(:can_be_archived?)).to eq true
    end

    it 'tests the functionality of can_be_archived method ' do
        expect(book.archived).to eq false
      end
  end
end
require './book'
require './item'

describe Book do
  context 'book class' do
    it 'checks if the parent class is Item' do
      expect(Book.superclass).to equal(Item)
    end
    it 'should archived the book because the publish date was more than 10 years ago' do
      book = Book.new('2000-01-04', 'castellana', 'good')
      expect(book.can_be_archived?).to be true
    end
  end
end

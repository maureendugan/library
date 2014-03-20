require 'spec_helper'


describe Book do
  describe '#initialize' do
    it 'creates an instance of a Book' do
      test_book = Book.new({:title => "History of Art"})
      test_book.should be_an_instance_of Book
    end
  end

  describe '.all' do
    it 'should show all the books library' do
      Book.all.should eq []
    end
  end

  describe '.create' do
    it 'creates an instance of a Book' do
      test_book = Book.create("Gone With the Wind")
      test_book.should be_an_instance_of Book
      Book.all.should eq [test_book]
    end
  end

  describe '#save' do
    it 'saves an instance of a book to the database' do
      test_book = Book.create("White Fang")
      Book.all.should eq [test_book]
    end
  end

  describe '#==' do
    it 'compares two books to see if the title and id are the same' do
      test_book1 = Book.new({:title => 'Where the Wild Things Are', :id => 5})
      test_book2 = Book.new({:title => 'Where the Wild Things Are', :id => 5})
      test_book2.should eq test_book1
    end
  end
end


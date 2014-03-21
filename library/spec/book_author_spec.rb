require 'spec_helper'

describe BookAuthor do
  describe '#initialize' do
    it 'creates an instance of a book_author' do
      test_book_author = BookAuthor.new({:authors_id => 2, :books_id => 4})
      test_book_author.should be_an_instance_of BookAuthor
    end
  end

  describe '.all' do
    it 'should show all the authors library' do
      BookAuthor.all.should eq []
    end
  end

  describe '.create' do
    it 'creates an instance of a books_authors for a new author and book' do
      test_book_author = BookAuthor.create("History of Rome", "Seneca")
      test_book_author.should be_an_instance_of BookAuthor
      BookAuthor.all.should eq [test_book_author]
    end
    it 'creates an instance of a books_authors for an old author and new book' do
      old_author = Author.create("Seneca")
      test_book_author = BookAuthor.create("History of Rome", "Seneca")
      Author.all.should eq [old_author]
    end
    it 'creates an instance of a books_authors adds a second author to a given book' do
      old_author = Author.create("Seneca")
      test_book_author = BookAuthor.create("History of Rome", "Seneca")
      test_book_author = BookAuthor.create("History of Rome", "Julius Caesar")
      Author.all.length.should eq 2
    end
  end

  # describe '#update' do
  #   it 'should update a author\'s author_id' do
  #     test_book_author = BookAuthor.create('Mark')
  #     test_book_author.update({:author_id => '1'})
  #     BookAuthor.all.first.author_id.should eq 1
  #   end
  # end

  # describe '#destroy' do
  #   it 'should remove a author from the database' do
  #     test_book_author = BookAuthor.create("Plato")
  #     test_book_author.destroy
  #     BookAuthor.all.should eq []
  #   end
  # end

  describe '.search_for_books_by_author' do
    it 'returns the books in the library written by a particular author' do
      test_entry1 = BookAuthor.create("Lord of the Flies", "William Golding")
      test_entry2 = BookAuthor.create("Brave New World", "Aldous Huxley")
      test_entry3 = BookAuthor.create("Brave New World Part II", "Aldous Huxley")
      BookAuthor.search_for_books_by_author("Aldous Huxley").should eq ['Brave New World', 'Brave New World Part II']
    end
  end

  describe '.search_for_authors_of_book' do
    it 'returns the authors of a book' do
      test_entry1 = BookAuthor.create("Special Report", "Ellie")
      test_entry2 = BookAuthor.create("Special Report", "Moe")
      BookAuthor.search_for_authors_of_book("Special Report").should eq ["Ellie", "Moe"]
    end
  end

  describe '#save' do
    it 'saves an instance of a book_author to the database' do
      test_book_author = BookAuthor.new({:authors_id => 5, :books_id => 13})
      test_book_author.save
      BookAuthor.all.should eq [test_book_author]
    end
  end

  describe '#==' do
    it 'compares two book_authors to see if the authors_id, books_id and id are the same' do
      test_book_author1 = BookAuthor.new({:authors_id => 1, :books_id => 4, :id => 5})
      test_book_author2 = BookAuthor.new({:authors_id => 1, :books_id => 4, :id => 5})
      test_book_author2.should eq test_book_author1
    end
  end
end

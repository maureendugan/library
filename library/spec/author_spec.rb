require 'spec_helper'

describe Author do
  describe '#initialize' do
    it 'creates an instance of a author' do
      test_author = Author.new({:name => "Homer"})
      test_author.should be_an_instance_of Author
    end
  end

  describe '.all' do
    it 'should show all the authors library' do
      Author.all.should eq []
    end
  end

  describe '.create' do
    it 'creates an instance of a author' do
      test_author = Author.create("Seneca")
      test_author.should be_an_instance_of Author
      Author.all.should eq [test_author]
    end
  end

  describe '#update' do
    it 'should update a author\'s name' do
      test_author = Author.create('Mark')
      test_author.update({:name => 'Mark Twain'})
      Author.all.first.name.should eq 'Mark Twain'
    end
  end

  describe '#destroy' do
    it 'should remove a author from the database' do
      test_author = Author.create("Plato")
      test_author.destroy
      Author.all.should eq []
    end
  end

  describe '#save' do
    it 'saves an instance of a author to the database' do
      test_author = Author.create("Jack London")
      Author.all.should eq [test_author]
    end
  end

  describe '#==' do
    it 'compares two authors to see if the name and id are the same' do
      test_author1 = Author.new({:name => 'Mark Twain', :id => 5})
      test_author2 = Author.new({:name => 'Mark Twain', :id => 5})
      test_author2.should eq test_author1
    end
  end
end

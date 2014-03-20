require 'rspec'
require 'pg'
require './lib/author'
require './lib/book'
require './lib/book_author'


DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM books_authors *;")
  end
end

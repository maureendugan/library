require 'rspec'
require 'pg'
require './lib/author'
require './lib/book'
require './lib/book_author'


DB = PG.connect({:dbname => 'library'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
  end
end

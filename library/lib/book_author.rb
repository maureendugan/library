class BookAuthor

  attr_reader :id, :authors_id, :books_id

  def initialize(attributes)
    @authors_id = attributes[:authors_id]
    @books_id = attributes[:books_id]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM books_authors;")
    books_authors = []
    results.each do |result|
      authors_id = result['authors_id'].to_i
      books_id = result['books_id'].to_i
      id = result['id'].to_i
      books_authors << BookAuthor.new({:authors_id => authors_id, :books_id => books_id, :id => id})
    end
    books_authors
  end

  def self.create(book_title, author_name)
    new_author_id = if Author.search_id(author_name) == nil then Author.create(author_name).id else Author.search_id(author_name) end
    new_book_id = if Book.search_id(book_title) == nil then Book.create(book_title).id else Book.search_id(book_title) end
    new_book_author = BookAuthor.new({:books_id => new_book_id, :authors_id => new_author_id})
    new_book_author.save
    new_book_author
  end

  def self.search_for_books_by_author(author_name)
    books = []
    results = DB.exec("SELECT title FROM
                      authors JOIN books_authors ON (authors.id = authors_id)
                              JOIN books ON (books.id = books_id)
                              WHERE name = '#{author_name}';")
    results.each do |result|
      books << result['title']
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO books_authors (authors_id, books_id) VALUES ('#{@authors_id}', '#{@books_id}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_BA)
    self.id == another_BA.id && self.authors_id == another_BA.authors_id && self.books_id == another_BA.books_id
  end
end

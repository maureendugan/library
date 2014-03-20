class Book
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM books;")
    books = []
    results.each do |result|
      title = result['title']
      id = result['id'].to_i
      books << Book.new({:title => title, :id => id})
    end
    books
  end

  def self.create(title)
    book = Book.new({:title => title})
    book.save
    book
  end

  def update(attributes)
    @title = attributes[:title]
    DB.exec("UPDATE books SET title = '#{@title}' WHERE id = '#{@id}';")
  end

  def destroy
    DB.exec("DELETE FROM books WHERE id = #{@id};")
  end

  def self.search_id(search_title)
    result = DB.exec("SELECT id FROM books WHERE title = '#{search_title}';")
    if result.first
      result.first['id'].to_i
    else
      nil
    end
  end

  def save
    result = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_book)
    self.title == another_book.title && self.id == another_book.id
  end
end

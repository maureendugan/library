class Author
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    authors = []
    results = DB.exec("SELECT * FROM authors;")
    results.each do |author|
      authors << Author.new({:name => author['name'], :id => author['id'].to_i})
    end
    authors
  end

  def self.create(author_name)
    author = Author.new({:name => author_name})
    author.save
    author
  end

  def update(attributes)
    @name = attributes[:name]
    DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = '#{@id}';")
  end

  def destroy
    DB.exec("DELETE FROM authors WHERE id = '#{@id}';")
  end

  def self.search_id(author_name)
    result = DB.exec("SELECT id FROM authors WHERE name = '#{author_name}';")
    if result.first
      result.first['id'].to_i
    else
      nil
    end
  end

  def ==(another_author)
    self.name == another_author.name && self.id == another_author.id
  end

  def save
    result = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end
end

# require 'pg'
# DB = PG.connect({:dbname => 'library_test'})
# test_author = Author.create("Lincoln")
# p Author.search_id("asdf")


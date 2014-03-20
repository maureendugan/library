require './lib/book'
require './lib/author'
require './lib/book_author'
require 'pg'

DB = PG.connect({:dbname => 'library'})


def main_menu
  puts "*------------------------------*"
  puts "*    Welcome to the Library    *"
  puts "*------------------------------*"

  puts "*  press any key to continue   *"

  input = gets.chomp

  case input

  when 'l'
    librarian_menu
  when 'x'
    exit
  else
    patron_menu
  end
end

def librarian_menu
  puts "Enter your password"

  input = gets.chomp

  case input
  when 'epicodus'
    puts "A to add a book to the library"
    puts "S to search for a book or author"
    puts "X to return to main menu"
    choice = gets.chomp.downcase
    case choice
    when 'a'
      add_to_library
    when 's'
      search_library
    else
      main_menu
    end
  else
    patron_menu
  end
end

def patron_menu
  puts "What would you like to do?"
  gets.chomp

  main_menu

end

system "clear"
main_menu

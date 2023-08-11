require './student'
require './teacher'
require './rental'
require './book'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    return puts '0 Books currently available' if @books.empty?

    book_info = @books.each_with_index do |book, index| 
      puts "#{index + 1}. Title: #{book.title} by Author: #{book.author}"
  end
end

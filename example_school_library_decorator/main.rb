require_relative './teacher.rb'
require_relative './student.rb'
require_relative './book.rb'
require_relative './teacher.rb'


class App

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.length.positive?
      @books.each { |bk| puts "Title: #{bk.title}, Author: #{bk.author}" }
    else
      puts "No books available!"
    end
  end





end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './person'
require_relative './rental'

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
      puts 'No books available!'
    end
  end

  def list_all_people
    if @people.length.positive?
      @people.each { |person| puts "Id: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    else
      puts 'No person available!'
    end
  end

  def create_person
    puts 'To create a Student, Press 1'
    puts 'To create a Teacher, Press 2'
    option = gets.chomp

    if option != '1' && option != '2'
      puts 'Please choose between 1 and 2'
      return
    end

    case option
    when '1'
      print 'Give Name: '
      name = gets.chomp

      print 'Assign parent permission? [y/n]: '
      permission = gets.chop

      @people << Student.new(name, permission)
      puts 'Student has been created successfully'

    when '2'
      print 'Give name: '
      name = gets.chomp

      print 'Enter age: '
      age = gets.chomp

      @people << Teacher.new(name, age)
      puts 'Teacher has been created successfully'
    end
  end

  def create_book
    print 'Give title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book has been created successfully'
  end

  def create_rental
    puts 'Pick a book from the list below using it number on the list:'
    @books.each_with_index do |bk, index|
      puts "#{index}. Title: #{bk.title}, Author: #{bk.author}"
    end
    picked_bk = gets.chop.to_i

    puts "\nChoose a person from the list below using their number on the list:"
    @people.each_with_index do |person, index|
      puts "#{index}. [#{person.class}] Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"
    end
    picked_person = gets.chomp.to_i

    print 'Enter the date today:'
    date = gets.chomp

    @rentals << Rental.new(date, @books[picked_bk], @people[picked_person])
    puts 'Rental has been created successfully'
  end

  def list_all_rentals
    print 'Enter Id: '
    id = gets.chomp

    all_rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    all_rentals.each do |rental|
      puts "Book: '#{rental.book.title}' by #{rental.book.author}, date: #{rental.date}"
    end
  end
end

def main
  app = App.new
  entry = nil

  while entry != '7'
    puts 'Hello !'
    puts 'Please make a selection by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print 'Add your selection'
    print ' '
    entry = gets.chomp

    case entry
    when '1'
      app.list_all_books

    when '2'
      app.list_all_people

    when '3'
      app.create_person

    when '4'
      app.create_book

    when '5'
      app.create_rental

    when '6'
      app.list_all_rentals

    when '7'
      puts "Thank you! We'd wish to serve you again"
    end
    puts "\n"
  end
end

main
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

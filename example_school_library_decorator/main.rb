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

  def list_all_people
    if @people.length.positive?
      @people.each { |person| puts "Id: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    else
      puts "No person available!"
    end
  end

  def create_person

    puts "To create a Student, Press 1"
    puts "To create a Teacher, Press 2"
    option = gets.chomp

    if option != "1" || option != "2"
      puts "Please choose between 1 and 2"
      return
    end

    case option
    when "1"
      puts "Give Name: "
      name = gets.chomp

      puts "Assign parent permission? [y/n]: "
      permission = gets.chop

      @people = Student.new(name, permission)
      puts "Student has been created successfully"

    when "2"
      puts "Give Name: "
      name = gets.chomp

      puts "Enter age: "
      age = gets.chomp

      @people = Person.new(name, age)
      puts "Teacher has been created successfully"
    end

  end









end

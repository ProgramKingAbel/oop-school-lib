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

    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title} by Author: #{book.author}"
    end
  end

  def list_all_people
    return puts 'No people Registered' if @people.empty?

    @people.each_with_index do |person, index|
      puts "#{index + 1}. [#{person.class}], id: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    loop do
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number:'
      input = gets.chomp

      case input
      when '1'
        create_student
        break
      when '2'
        create_teacher
        break
      else
        puts 'Invalid input.Please Choose 1 for student 2 for teacher.'
      end
    end
  end

  def create_student
    print 'Enter Student Age:'
    age = gets.chomp.to_i

    until age.positive?
      print 'Please Enter a valid age > 0'
      age = gets.chomp.to_i
    end

    print 'Enter Student Name'
    name = gets.chomp

    print 'Does Student have parent permission to attend events? [Y/N]'
    permission = gets.chomp.upcase

    until %w[Y N].include?(permission)
      print 'Invalid Input. Please enter Y or N: '
      permission = gets.chomp.upcase
    end

    parent_permission = permission == 'Y'

    student = Student.new(age, 'classroom', name: name, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully'
  rescue StandardError => e
    puts "An error occured: #{e.message}"
  end

  def create_teacher
    print 'Enter teacher name'
    name = gets.chomp

    print 'Enter teacher Age:'
    age = gets.chomp.to_i
    until age.positive?
      print 'Please Enter a Valid Age: > 0'
      age = gets.chomp.to_i
    end

    print 'Enter field of specialization'
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher

    puts 'Teacher created Successfully'
  rescue StandardError => e
    puts "An error occured: #{e.message}"
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    until title.strip != ''
      print 'Title cannot be empty. Please enter a valid title: '
      title = gets.chomp
    end

    print 'Enter the Author name: '
    author = gets.chomp

    until author.strip != ''
      print 'Author name cannot be empty. Please enter a valid author name: '
      author = gets.chomp
    end

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end
end

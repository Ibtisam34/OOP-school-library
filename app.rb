require './rental'
require './person'
require './classroom'
require './book'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def start_app
    selection_cases
  end

  def show_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def show_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each do |person|
        puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_details = gets.chomp
    case person_details
    when '1'
      student_details
    when '2'
      teacher_details
    else
      puts 'Please enter valid number'
      create_person
    end
  end

  def student_details
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [y/n]:'
    permission = gets.chomp.downcase
    permission = permission == 'y'
    @people << Student.new(age, name, permission, nil)
    puts 'Student created successfully'
  end

  def teacher_details
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books = Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    book_rental = @books[book_index]

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person_rental = @people[person_index]
    puts 'Date:'
    date = gets.chomp
    @rental << Rental.new(date, book_rental, person_rental)
    puts 'Rental created successfully'
  end

  def rentals_person_id
    print 'ID of person: '
    id_rental = gets.chomp.to_i
    rentals = @rental.select { |rental| rental.person.id == id_rental }
    puts 'Rental: '
    rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.person.name}" }
  end
end

require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @student = []
    @teacher = []
    @rental = []
    @people = []
  end

  def list_books
    @books.each_with_index { |book, index| puts "(#{index}) Title: #{book.title}, Author: #{book.author} " }
  end

  def list_people
    @student.each { |student| puts " [Student] Name: #{student.name}, Age: #{student.age}, ID:#{student.id} " }
    @teacher.each { |teacher| puts " [Teacher]  Name: #{teacher.name}, Age: #{teacher.age}, ID:#{teacher.id}" }
  end

  def show_people
    @people = @student + @teacher
    @people.each_with_index do |people, index|
      puts "(#{index}) Name: #{people.name}, Age: #{people.age}, ID:#{people.id}"
    end
  end

  def show_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental.each { |rent| puts " Date: #{rent.date} Book: #{rent.book.title} " if rent.person.id == id }
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_id = gets.chomp.to_i
    puts "\nSelect a person from the following list by number (not id)"
    show_people
    person_id = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    rent = Rental.new(@people[person_id], @books[book_id], date)
    @rental.push(rent)
    puts "Rental created successfully\n\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book created successfully\n\n"
  end

  def create_teacher_student
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp
    case num
    when '1'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Parent permisssion [y/n]:'
      permission = gets.chomp
      student = Student.new(1, age, name, parent_permission: permission)
      @student.push(student)
      puts "Person created successfully\n\n"
    when '2'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Specialization:'
      specialz = gets.chomp
      teacher = Teacher.new(age, specialz, name, parent_permission: true)
      @teacher.push(teacher)
      puts "Person created successfully\n\n"
    else
      puts 'invalid'
    end
  end
end

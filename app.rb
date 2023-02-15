require './book'
require './student'
require './teacher'
require './rental'
class App
  def initialize
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @students.each do |student|
      puts "[Student] Name: #{student.name}, Age: #{student.age}, ID: #{student.id}"
    end
    @teachers.each do |teacher|
      puts "[Teacher] Name: #{teacher.name}, Age: #{teacher.age}, ID: #{teacher.id}"
    end
  end

  def show_people
    @people = @students + @teachers
    @people.each_with_index do |person, index|
      puts "(#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def show_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    rentals = @rentals.select { |rental| rental.person.id == id }
    rentals.each do |rental|
      puts " Date: #{rental.date} Book: #{rental.book.title}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_id = gets.chomp.to_i
    # Check that the book with the specified ID exists in the @books array
    if @books[book_id]
      @book = @books[book_id] # assign selected book to @book
      puts "\nSelect a person from the following list by number (not id)"
      show_people
      person_id = gets.chomp.to_i
      # Check that the person with the specified ID exists in the @people array
      if @people[person_id]
        print "\nDate: "
        date = gets.chomp
        rental = Rental.new(@people[person_id], @book, date)
        @book.rentals.push(rental) unless @book.rentals.include?(rental)
        @rentals.push(rental)
        puts "Rental created successfully\n\n"
      else
        puts 'Invalid person ID'
      end
    else
      puts 'Invalid book ID'
    end
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

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp
    case num
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission: [Y/N]? '
    parent_permission = gets
    permission = true if parent_permission.downcase == 'y'
    permission = false if parent_permission.downcase == 'n'
    @students.push(Student.new('Unknown', age, name, parent_permission: permission))
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @teachers.push(teacher)
    puts "Teacher created successfully\n\n"
  end
end

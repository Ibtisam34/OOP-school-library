require './rental'
class Book
  # code for the Book class

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(date, person)
    @rentals.push(Rental.new(date, self, person))
  end
end

# sample data for Book
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')

book1.rentals << rental1
book2.rentals << rental2

# Save books data to a file
File.write('book.json', 'w') do |f|
  f.write(JSON.dump([book1, book2]))
end

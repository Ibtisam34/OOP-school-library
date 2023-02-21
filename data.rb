require_relative 'book'
require_relative 'person' 
require_relative 'rental'


# sample data for Book
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')

book1.rentals << rental1
book2.rentals << rental2

# Save books data to a file
File.write('book.json', 'w') do |f|
  f.write(JSON.dump([book1, book2]))
end


# sample data for Person
person1 = Person.new(25, 'John', true)
person2 = Person.new(30, 'Jane', true)

person1.rentals << rental1
person2.rentals << rental2

# Save people data to a file
# File.write('people.json', JSON.dump([person1, person2]))
File.write('people.json', 'w') do |f|
  f.write(JSON.dump([person1, person2]))
end

# sample data for Rental
rental1 = Rental.new(book1, person1, Date.today)
rental2 = Rental.new(book2, person2, Date.today - 7)

# Save rentals data to a file

File.write('rentals.json', JSON.dump([rental1, rental2]))
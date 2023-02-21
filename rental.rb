require_relative 'book'
require_relative 'person'
class Rental
  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    @person.rentals.push(self) unless person.rentals.include?(self)
    @book.rentals.push(self) unless book.rentals.include?(self)
  end
  attr_accessor :date, :book, :person
end

# # sample data for Rental
# rental1 = Rental.new(book1, person1, Date.today)
# rental2 = Rental.new(book2, person2, Date.today - 7)

# # Save rentals data to a file

# File.write('rentals.json', JSON.dump([rental1, rental2]))
 

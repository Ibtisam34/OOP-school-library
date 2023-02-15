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

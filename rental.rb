class rentals 
  attr_accesor :date, :book, :person

  def initialize(date,book,person)
    @date = date
    @book = book
    @person = person

     book.rentals << self
     person.rentals << self 
  end
end
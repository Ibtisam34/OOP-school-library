class Book
<<<<<<< HEAD
=======
  # code for the Book class



>>>>>>> 69b61c04e54396ecb234cb44e6f01e6612877ec5
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

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

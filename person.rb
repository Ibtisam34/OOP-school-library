require './nameable'
class Person < Nameable
  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  private

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    is_of_age || parent_permission
  end

  def add_rental(book, date)
    @rentals.push(Rental.new(date, book, self))
  end

  def correct_name
    @name
  end
end

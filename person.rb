require_relative 'rental'
require_relative 'nameable' 

class Person < Nameable
  def initialize(age, name = 'Unknown', _rentals, parent_permission: true)
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

# # sample data for Person
# person1 = Person.new(25, 'John', true)
# person2 = Person.new(30, 'Jane', true)

# person1.rentals << rental1
# person2.rentals << rental2

# # Save people data to a file
# # File.write('people.json', JSON.dump([person1, person2]))
# File.write('people.json', 'w') do |f|
#   f.write(JSON.dump([person1, person2]))
# end

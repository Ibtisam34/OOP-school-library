class Person
  attr_accesor :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end
end

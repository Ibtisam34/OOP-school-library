# frozen_string_literal: true

# Class documentation for Person
class Person
  attr_accessor :id, :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    age >= 18
    enddef can_use_services?
    of_age? || @parent_permission
  end
end

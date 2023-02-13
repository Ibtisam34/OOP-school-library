# frozen_string_literal: true

# Class documentation for Student
class Student < Person
  attr_reader :classroom

  def initialize(name = 'Unknown', age = nil, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

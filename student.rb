require 'person'
class Student < Person
  def initialize(name = 'Unknown', age = nil, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end
  attr_reader :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

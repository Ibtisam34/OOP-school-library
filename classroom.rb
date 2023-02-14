class Classroom
  attr_accesor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_sudent(student)
    @students << student
    student.classroom = self
  end
end

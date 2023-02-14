class Classroom
  attr_accesor :label
  attr_reader :Students

  def initialize(label)
    @label = label
    @Students = []
  end

  def add_sudent(student)
    @Students << student
    student.classroom = self
  end
end

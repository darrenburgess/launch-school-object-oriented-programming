class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end  

  def better_grade_than?(student)
    grade > student.grade
  end

  def public_grade
    grade
  end

  protected 

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 80)

puts joe.public_grade
puts "joe beat bob" if joe.better_grade_than?(bob)

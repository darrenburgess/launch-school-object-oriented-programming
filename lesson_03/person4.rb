class Person
  @@total_people = 0

  def self.total_people
    @@total_people
  end

  def initialize
    @@total_people += 1
  end

  def total_people
    @@total_people
  end
end

puts Person.total_people

bob = Person.new
joe = Person.new

puts Person.total_people

Person.new

puts Person.total_people



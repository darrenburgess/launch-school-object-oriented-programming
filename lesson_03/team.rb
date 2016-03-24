class Person
  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age = a
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt", 46)

cowboys << emmitt

puts cowboys.members.inspect

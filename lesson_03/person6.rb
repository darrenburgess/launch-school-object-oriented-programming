class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("bob", 49)
kim = Person.new("kim", 33)

puts "bob is older than kim" if bob > kim

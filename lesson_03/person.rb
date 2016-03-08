class Person
  attr_accessor :name
  
  def ==(other)
    name == other.name
  end
end


bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

puts bob == bob2

bob_copy = bob

puts bob == bob_copy

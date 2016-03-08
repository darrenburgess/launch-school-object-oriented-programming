class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name
  end
end

bob = Person.new 'bob'
joe = Person.new 'joe'

puts bob.inspect
puts joe.inspect
puts bob.get_name

puts "instance variables are scoped at the level of the object.  This means that they are available in all instance methods of that object without needing to pass them explicitly as arguments to the method"


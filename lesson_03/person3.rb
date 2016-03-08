class Person
  def initialize
    @name = "bob"
  end

  def get_name
    @name
  end
end

bob = Person.new

puts bob.get_name


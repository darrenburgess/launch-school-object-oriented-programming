class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def to_s
    "this is the name of the person: #{name}"
  end
end

bob = Person.new("steve")

bob.name = "bob"

puts bob

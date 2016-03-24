class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  attr_accessor :name
  def dog_name
    "bark. #{name}"
  end
end

teddy = Dog.new("teddy")

puts teddy.dog_name

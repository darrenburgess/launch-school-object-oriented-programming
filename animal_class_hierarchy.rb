class Animal
end

module Swimmable
  def swims?
    "I can swim"
  end
end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

milo = Dog.new
oreo = Cat.new

puts milo.swims?
puts oreo.swims?

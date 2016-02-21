module Walkable
  def walk
    "I can walk"
  end
end

module Swimmable
  def swim
    "I can swim"
  end
end

module Climbable
  def climb
    "I can climb"
  end
end

class Animal
  include Walkable

  def speak
    "I am animal.  I am speaking"
  end
end

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "GoodDog ancestors"
puts GoodDog.ancestors
puts "------"

puts Animal.ancestors

fido = Animal.new
puts fido.speak
puts fido.walk
puts fido.swim

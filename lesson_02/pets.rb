class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

module Speak
  def speak(sound)
    puts sound
  end
end

module Swims
  def swimmable
    "yes, I can swim"
  end
end

class Person < Animal
  attr_accessor :pets
  include Swims
  
  def initialize(name)
    super
    @pets = []
  end
end

class Pet < Animal
  attr_accessor :name
end

class Dog < Animal
  include Swims
  include Speak
end

class Cat < Animal
  include Speak
end

class Fish < Animal
  include Swims
end

darren = Person.new("Darren")
oreo = Cat.new("Oreo")
milo = Dog.new("Milo")
egbert = Fish.new("Egbert")

puts darren.name
puts oreo.name
puts milo.name
puts egbert.name

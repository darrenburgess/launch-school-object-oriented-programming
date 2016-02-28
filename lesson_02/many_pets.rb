class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def speak(sound)
    sound
  end
end

class Cat < Pet
  def claws_sharp?
    true
  end
end

class Dog < Pet
  def claws_sharp?
    false
  end
  
  def swims?
    true
  end
end
bob = Person.new("robert")
oreo = Cat.new
milo = Dog.new

bob.pets << oreo 
bob.pets << milo

bob.pets.each do |pet|
  if pet.class == Dog
    puts pet.speak "Arf"
  else
    puts pet.speak "Meow"
  end
end

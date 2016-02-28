class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Pet
  def speak(sound)
    sound
  end
end

class Dog < Pet
  def swims?
    true
  end
end

bob = Person.new("Robert")
milo = Dog.new

bob.pet = milo
puts bob.pet.speak("doggie sez woof!")

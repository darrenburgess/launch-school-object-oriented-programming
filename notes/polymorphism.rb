class Animal
  attr_reader :species

  def initialize(species)
    @species = species
  end
  
  def speak
    "speaking"
  end
end

module Constructor
  def initialize(species)
    super
  end
end

class Dog < Animal
  include Constructor

  def speak
    "arf"
  end
end

class Cat < Animal
  include Constructor

  def speak
    "meow"
  end
end

cat = Cat.new("feline")

dog = Dog.new("canine")

p dog.species
p dog.speak

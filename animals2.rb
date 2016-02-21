class Animal
  def speak(sound)
    puts sound
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak(sound)
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

milo = GoodDog.new("Milo")

oreo = Cat.new

puts milo.speak("arf")
puts oreo.speak("meow")

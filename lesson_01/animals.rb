class Animal
  def speak(sound)
    puts sound
  end
end

class Dog < Animal
end

class Cat < Animal
end

milo = Dog.new

oreo = Cat.new

milo.speak("arf")
oreo.speak("meow")

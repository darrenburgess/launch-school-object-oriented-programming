class Pet
  def speak(sound)
    sound
  end
  
  def run
    'running!'
  end

  def jump
    'jumping'
  end

end

class Dog < Pet
  def swim
    'swimming'
  end


  def fetch
    'fetching'
  end
end

class Cat < Pet
  def swim
    "can't swim"
  end

  def fetch
    "can't fetch"
  end
end

class BullDog < Dog
  def swim
    "can't swim"
  end
end


teddy = Dog.new
puts teddy.speak("arf")
puts teddy.swim

oreo = Cat.new
puts oreo.speak("meow")
puts oreo.swim

puts Cat.ancestors.inspect


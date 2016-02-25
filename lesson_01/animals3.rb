class Animal
  def speak(sound)
    sound 
  end
end

class GoodDog < Animal
  def speak(sound)
    super + " from GoodDog class"
  end
end

milo = GoodDog.new

puts milo.speak("arf")


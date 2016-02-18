# exercise 1 - how do you create an object in ruby
# define a class then instantiate an object of that class with new

module Traits
  def lays_eggs?
    false
  end

  def speak(sound)
    puts "#{sound}"
  end
end

class Mammal 
  include Traits
end

giraffe = Mammal.new
giraffe.speak("harumph!")
puts giraffe.lays_eggs?

# exercise 2 - what is a module and its purpose
# modules encapsulate behaviors that can be included in a class.  
# use the include word to 'mixin' a module

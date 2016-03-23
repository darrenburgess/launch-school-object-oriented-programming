module Speed
  def go_fast
    puts "I am a #{self.class} and go fast"
  end
end

class Car
  include Speed
  def go_slow
    puts "going slow"
  end
end

car = Car.new

car.go_fast

# we use the class method to output the class of the object instance.  In this case the class is Car 

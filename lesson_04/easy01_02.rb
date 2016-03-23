module Speed
  def go_fast
    puts "I am a #{self.class} and going fast"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am driving slow"
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "going very slow"
  end
end

truck = Truck.new

truck.go_fast


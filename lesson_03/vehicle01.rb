class Vehicle
  @@wheels = 4
  
  def self.wheels
    @@wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2
end

class Car < Vehicle
end

puts Car.wheels
puts Motorcycle.wheels

puts Vehicle.wheels

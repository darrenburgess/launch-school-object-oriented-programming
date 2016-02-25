# my_car.rb

class Vehicle

  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def self.calc_mileage(gallons, miles)
    puts "mileage is #{miles/gallons}mpg"
  end

  def speed_up
    puts "how much faster do you want to go"
    speed = gets.chomp.to_i
    @current_speed += speed
  end

  def slow_down
    puts "how much slower do you want to go"
    speed = gets.chomp.to_i
    @current_speed = if @current_speed - speed < 0
                       0
                     else
                       @current_speed - speed
                     end
  end
  
  def to_s
    puts "my car is a #{year}, #{color} #{model}"
  end
 
  def change_color
    puts "paint your car:"
    self.color = gets.chomp
  end
  
  def show_color
    puts "color is: #{self.color}"
  end

  def spray_paint(new_color)
    self.color = new_color
    show_color
  end

  def shut_down
    @current_speed = 0
    puts "parking the car"
  end

  def current_speed
    puts "speed is #{@current_speed}"
  end
  
  def doors(num_doors)
    "your vehicle has #{num_doors} doors"
  end

  def fuel(fuel_type)
    "your vehicle uses #{fuel_type}"
  end

  def age
    "vehicle: #{self.model} is age: #{years_old}"
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

module Capacity
  def towable
    "yes I can tow stuff"
  end
  
  def moveable
    "you will be expected to help friends move"
  end
end

class MyTruck < Vehicle
  include Capacity
  NUMBER_DOORS = 2
  FUEL = "diesel"
end

class MyCar < Vehicle
  NUMBER_DOORS = 4
  FUEL = "gasolene"
end

truck = MyTruck.new(2002, "Ford", "F150")
car = MyCar.new(2002, "Buick", "Century")
car2 = MyCar.new(2010, "Kia", "Rondo")

puts truck.towable
puts truck.moveable

puts truck.doors(MyTruck::NUMBER_DOORS)
puts car.fuel(MyCar::FUEL)
puts Vehicle.total_number_of_vehicles
puts "---MyCar ancestors---"
puts MyCar.ancestors
puts "---Vehicle ancestors---"
puts Vehicle.ancestors
puts "---MyTruck ancestors---"
puts MyTruck.ancestors

puts truck.age

truck.speed_up
truck.current_speed
truck.slow_down
truck.current_speed
truck.change_color
truck.show_color
truck.spray_paint("red")

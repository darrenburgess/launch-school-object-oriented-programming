# my_car.rb

class MyCar

  attr_accessor :color
  attr_reader :year, :model

  def self.calc_mileage(gallons, miles)
    puts "mileage is #{miles/gallons}mpg"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end
  
  def to_s
    puts "my car is a #{year}, #{color} #{model}"
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
end

buick = MyCar.new(2002, 'buick century', 'white')
puts buick
abort
MyCar.calc_mileage(22, 400)
buick.current_speed
buick.speed_up
buick.current_speed
buick.slow_down
buick.current_speed
buick.change_color
buick.show_color
buick.spray_paint("green")
buick.show_color
puts buick.year

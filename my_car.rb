# my_car.rb

class MyCar
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
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
  
  def shut_down
    @current_speed = 0
    puts "parking the car"
  end

  def current_speed
    puts "speed is #{@current_speed}"
  end
end

buick = MyCar.new(2002, 'buick century', 'white')
buick.current_speed
buick.speed_up
buick.current_speed
buick.slow_down
buick.current_speed

class Car
  attr_accessor :wheels, :color

  def initialize(wheels, color)
    @wheels = wheels
    @color = color
  end
end

buick = Car.new 4, "red"
p buick.color
buick.color = "blue"
p buick.color

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "brightness:  color:"
  end
end

#1. using return when and implicit return would work
#2. the attr_accessor methods are never used
#3. we can keep attr_accessor, but should interpolate
#the values in the information method
#4. method information is a class method however

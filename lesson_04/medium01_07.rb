class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "brightness: high color: green"
  end
end

# change the method name to information.  light is redundant,
# as this is the Light class.  we don't need to name space
# the methods

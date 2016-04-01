class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

oreo = Cat.new("domestic shorthair")
puts oreo.to_s

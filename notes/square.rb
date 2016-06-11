class Square
  attr_accessor :width, :height, :area
  def initialize width, height
    @width = width
    @height = height
    @area = @width * @height
  end

  def self.info
    "This is the #{name} class"
  end

  def +(other)
    area + other.area
  end
end

s1 = Square.new 4, 5
s2 = Square.new 2, 3

total = s1 + s2
p total
p Square.info

def s1.info
  "square: #{width} by #{height}"
end

p s1.info

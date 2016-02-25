class Box
  attr_accessor :width, :height
  @@count = 0

  BOX_COMPANY = "Acme Boxes"

  def initialize(w, h)
    @width = w
    @height = h
    @@count += 1
  end

  def self.print_count
    puts "box count: #{@@count}"
  end

  def get_area
    width * height
  end

  def private_to_s
    self.to_s
  end

  protected

  def to_s
    "box: #{width} wide by #{height} high"
  end
end

class SubBox < Box
  def compare(box)
    self.get_area > box.get_area
  end
end

box1 = SubBox.new(5, 3)
box2 = SubBox.new(7, 4)

puts "box 1 is smaller" if box2.compare(box1)

puts Box::BOX_COMPANY

box3 = SubBox.allocate
puts "#{box3.width} is the width of the box"

puts box1.private_to_s

puts box1.width
puts box2.height

box1.width = 9
puts box1.width

puts box1.get_area
puts Box.print_count

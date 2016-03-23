class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# to create a new instance of the class we call the
# new method on the class name as in:
# we also need to pass values to the instance variables

big_bag = Bag.new("red", "cotton")

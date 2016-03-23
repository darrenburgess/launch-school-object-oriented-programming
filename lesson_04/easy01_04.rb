class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new("apple")
pizza = Pizza.new("cheese")

puts pizza.instance_variables
puts apple.instance_variables
# the fruit class does not have an instance variable
# instance variables must have a @ prepended to the variable name
# as in @name

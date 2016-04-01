class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

oreo = Cat.new ("domestic shorthair")
oreo.make_one_year_older

puts oreo.age

# replace self with @.  In this case self is refering to the setter method provided by attr_accessor.

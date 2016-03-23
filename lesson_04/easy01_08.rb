class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age +=1
  end
end

cat = Cat.new("domestic")

cat.make_one_year_older
puts cat.age

# self in the make_one_year_older method refers to the object
# instance

class Animal
  def speak
    "hello"
  end
end

module ThingOne
  def thing_one
    "thing one"
  end
end

module ThingTwo
  def thing_two
    "thing two"
  end
end

class GoodDog < Animal
  attr_accessor :name, :age, :breed

  include ThingOne, ThingTwo

  @@number_of_dogs = 0

  puts "This is self for the #{name} class: #{self}"

  def initialize(name)
    @name = name
    @@number_of_dogs += 1
  end

  def change_info(years, type)
    self.age = years
    self.breed = type
  end

  def self.total_dogs
    @@number_of_dogs
  end

  def total_dogs
    @@number_of_dogs
  end
  
  def info
    "#{name} is a #{age} year old #{breed}"
  end

  def to_s
    "#{name} is a #{age} year old #{breed}"
  end

  def what_is_self
    self
  end
end

milo = GoodDog.new("milo")

system "clear"
milo.change_info(7, "yorkie")
p milo.info
p GoodDog.total_dogs
p milo.total_dogs
puts milo
p milo.what_is_self
p milo.thing_one
p milo.thing_two
p GoodDog.ancestors

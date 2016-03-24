class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark #{@name} Bark. Bark."
  end
end

milo = Dog.new("milo")

puts milo.dog_name



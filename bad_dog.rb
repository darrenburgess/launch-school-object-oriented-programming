class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

fido = BadDog.new(2, "fido")
puts fido.inspect

milo = GoodDog.new("black")
puts milo.inspect

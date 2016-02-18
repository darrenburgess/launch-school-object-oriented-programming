# good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end

  def name
    @name
  end

  def name=(n)
    @name = n
  end
end

sparky = GoodDog.new("Sparky")

puts sparky.speak
puts sparky.name

fido = GoodDog.new("Fido")
puts fido.speak

sparky.name = "Spartacus"
puts sparky.name

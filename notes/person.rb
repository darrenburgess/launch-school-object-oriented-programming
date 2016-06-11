class Animal
  @@count = 0
  def initialize(species)
    @species = species
    @@count += 1
  end

  def count
    @@count
  end

  def species
    @species
  end
end

class Person < Animal
  def initialize(name, age = 0)
    super("human")
    @name = name
    @age = age
  end

  def age
    @age
  end

  def to_s
    "name: #{name}"
  end

  def increase_age(years)
    @age += years
  end

  private

  def name
    @name
  end
end


darren = Person.new("darren")

p darren.to_s
p darren.species

p Person.ancestors
p darren.count

tom = Person.new "tom"
p tom.count

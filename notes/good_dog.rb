class GoodDog
  attr_accessor :name, :age, :breed

  def initialize(name)
    @name = name
  end

  def change_info(years, type)
    self.age = years
    self.breed = type
  end
  
  def info
    "#{name} is a #{age} year old #{breed}"
  end
end

milo = GoodDog.new("milo")

system "clear"
milo.change_info(7, "yorkie")
p milo.info

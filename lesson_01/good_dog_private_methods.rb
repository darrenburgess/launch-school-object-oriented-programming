class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def show_human_years
    puts "human years #{human_years}"
  end

  private

    def human_years
      self.age / DOG_YEARS
    end
end

milo = GoodDog.new("Milo", 7)

puts milo.name

puts milo.show_human_years

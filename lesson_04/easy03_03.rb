class AngryCat

  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "hisss"
  end
end

mittens = AngryCat.new(4, "mittens")
oreo = AngryCat.new(1, "Oreo")

mittens.age
oreo.age

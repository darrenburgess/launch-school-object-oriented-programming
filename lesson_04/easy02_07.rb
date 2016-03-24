class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# @@cats_count will iterate by 1 every time a new instance of the class
# is created.  to test this we would create an instance or two of the class
# the call Cat.cats_count

whiskers = Cat.new("fluffy")
oreo = Cat.new("domestic")

puts Cat.cats_count

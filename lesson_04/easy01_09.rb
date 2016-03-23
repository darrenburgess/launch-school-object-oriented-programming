class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count +=1
  end

  def self.cats_count
    @@cats_count
  end
end

cat = Cat.new "asdf"
oreo = Cat.new("domestic")

puts Cat.cats_count
puts oreo.cats_count

# self in this context refers to the class.  This makes 
# it a class method, rather than an instance method.
# If we call cats_count to the oreo object we get 
# a no method error

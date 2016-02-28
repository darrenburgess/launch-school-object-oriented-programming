class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    @name = (first_name + " " + last_name).strip
  end
end

bob = Person.new("Robert")
puts bob.first_name
puts bob.last_name
bob.last_name = "smith"
puts bob.name

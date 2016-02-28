class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    full_name(name)
  end

  def same_person?(other_person)
    puts "same person" if self.name == other_person.name
  end

  def to_s
    name
  end

  private

  def full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end
 
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
bob.same_person?(rob)

puts "person name is #{bob}"

class Person
  TITLES = %w(Mr Mrs Ms Dr)

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

puts Person.titles

bob = Person.new('bob')

puts bob.name

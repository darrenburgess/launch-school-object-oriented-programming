class Person
  attr_accessor :name, :age
  def initialize(n, a)
    @name = a
    @age = n
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end

cowboys = Team.new("dallas")
cowboys.members << Person.new("Troy Aikman", 48)
cowboys.members << Person.new("Emmitt Smith", 46)
cowboys.members << Person.new("Michael Irvin", 49)

niners = Team.new("SF 49ers")
niners.members << Person.new("Joe", 59)
niners.members << Person.new("Jerry", 52)
niners.members << Person.new("Deion", 47)

dream_team = cowboys + niners

puts dream_team.inspect

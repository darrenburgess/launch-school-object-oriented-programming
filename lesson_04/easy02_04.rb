class BeesWax
  def initialize(type)
    @type = type
  end


  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "i am a #{@type} of Beez wax"
  end
end

#simplify the class

class BeezWax2
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "i am a #{type} of BeesWax "
  end
end

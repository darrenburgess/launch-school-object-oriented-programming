class Cube
  attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

a_cube = Cube.new(35)

puts a_cube.volume
puts a_cube.instance_variable_get("@volume")
puts a_cube.get_volume
puts a_cube.to_s

# in order to access the instance variable of the class we 
# can use the attr_accessor method and pass the variable
# as a symbol.  
# alternatively, we could use the attr_reader method if we
# only want to be able to read and not write to the 
# instance variable
# 
# we could also add a get_volume method that returns @volume
#
# the to_s method returns the object unique ID of the object
# it also prints out the class of the object and actually
# an encoded form of the object id

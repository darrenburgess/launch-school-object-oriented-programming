module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste

  def ancestors
    Orange.ancestors
  end
end

class HotSauce
  include Taste
end

puts Orange.ancestors
puts "--------"
puts HotSauce.ancestors
puts "--------"
fruit = Orange.new
puts fruit.ancestors

# to determine the lookup chain for a class, call ancestors 
# on the class name

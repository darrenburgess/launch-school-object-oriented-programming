class Parent
  def say_hi
    p "hi from parent"
  end
end

class Child < Parent
  def say_hi
    p "hi from child"
  end
end

son = Child.new
son.send :say_hi

puts son.instance_of? Parent 


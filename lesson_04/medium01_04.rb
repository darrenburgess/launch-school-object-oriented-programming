class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet("hi")
  end
end

class GoodBye < Greeting
  def bye
    greet("bye")
  end
end

x = Hello.new
x.hi

y = GoodBye.new
y.bye

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("hello")
  end

  def self.hi2
    greet("asdf")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# case 1: will output Hello
hello = Hello.new
hello.hi

# case 2: will output no method error has bye is not in the method
# chain of Hello or Greeting
#hello = Hello.new
#hello.bye

# case 3: wrong number of arguments error
#hello = Hello.new
#hello.greet

# case 4: outputs Goodbye
hello = Hello.new
hello.greet("goodbye")

# case 5: error - undefined method.  Calling an instance method on a class

class Base
  def show x=0, y=0
    p "Base class, x: #{x}, y: #{y}"
  end
end

class Derived < Base
  def show x, y
    super
    super x
    super x, y
    super()
  end
end


d = Derived.new
d.show 3, 3

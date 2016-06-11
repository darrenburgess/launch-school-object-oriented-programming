class MMath
  PI = 3.14

  def show_pi
    PI
  end
end


class Derived < MMath
end

p MMath::PI
test = MMath.new
p test.show_pi
test2 = Derived.new
p Derived::PI
p test2.show_pi


class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s_old
    if filling_type && glazing
      "#{filling_type} with #{glazing}"
    elsif filling_type && !glazing
      filling_type
    elsif !filling_type && glazing
      "plain with #{glazing}"
    else
      "plain"
    end
  end

  def to_s
    filling = filling_type ? filling_type : "Plain"
    with = glazing ? " with " : ""
    "#{filling}#{with}#{glazing}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

class Person
  attr_reader :cash
  def initialize
    @heros = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' =>2}
  end

  def cash_on_hand
    cash['ones'] * 1 + 
    cash['fives'] * 5 +
    cash['tens'] * 10 +
    cash['twenties'] * 20
  end

  def heros
    @heros.join(', ')
  end
end

joe = Person.new
puts joe.cash_on_hand
puts joe.heros

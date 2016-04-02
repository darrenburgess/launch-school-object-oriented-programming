class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

test = BankAccount.new(100)

puts test.positive_balance?

# in line 9 an '@' is not required for balance, to make
# it an instance variable because we are using the
# attr_reader method to create a method that can read
# the value of the instance variable @balance

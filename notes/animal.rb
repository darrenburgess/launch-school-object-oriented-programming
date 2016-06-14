class Animal
  def public_method
    "testing: " + protected_method
  end

  protected

  def protected_method
    "yes: protected"
  end

  private

  def private_method
    "yes: private"
  end
end

test = Animal.new

p test.public_method

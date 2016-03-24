class Oracle
  def predict_the_future
    "you will " + choices.sample
  end

  def choices
    ["eat lunch", "take nap", "work late"]
  end
end

oracle = Oracle.new
puts oracle.predict_the_future

# will output the one of the values in the array

class Oracle
  def predict_the_future
    "you will " + choices.sample
  end

  def choices
    ["eat lunch", "take nap", "work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit vegas", "fly to fiji", "romp in rome"]
  end
end

trip = RoadTrip.new

puts trip.predict_the_future

# result will be to choose from the array of choices
# in the RoadTrip class.  Road trip overrides Oracle.  

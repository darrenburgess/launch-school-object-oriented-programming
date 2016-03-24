class Game
  def play
    "start game"
  end
end

class Bingo < Game
  def rules
    # rules here
  end
end

# in order to allow class Bingo to inherit the play method we could make a sub class of Game as in:  class Bingo < Game

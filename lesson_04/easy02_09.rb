class Game
  def play
    "start"
  end
end

class Bingo < Game
  def play
    "bingo start"
  end

  def rules_of_play
    #rules
  end
end

game = Bingo.new

puts game.play

# in this case the Bingo.play method overrides the Game.play method.  This is because the ruby starts in the current class and looks for the method there.  If it does not find it, then ruby will continue up the ancestors chain of classes until it finds the method.  It will return a no method error if it does not.


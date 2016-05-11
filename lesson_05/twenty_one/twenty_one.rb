
class Participant
  attr_accessor :hand

  def initialize
    @hand
  end

  def hit 
  end

  def stick
  end

  def score
  end

  def busted
  end
end

class Player < Participant
  attr_accessor :stash

  def initialize
    @stash
  end

  def place_bet
  end

  def calculate_stash
  end
end

class Dealer < Participant
  def initialize
  end

  def stick
  end
end

class Deck
  def initialize
    @suits
    require 'pry'
    e
  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end
binding.pry


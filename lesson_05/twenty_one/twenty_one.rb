require 'pry'

module Setup
  def get_player_count
  end

  def get_player_names
  end
end

module UserInterface
  def initialize
  end

  def clear
    system 'clear' or system 'cls'
  end

  def diplay_hands
  end

  def prompt_player
  end
end

module Messaging
  def display(message)
    puts "==> #{message}"
  end
end

module Strategy
  @chart = 'create a hash of 2 deck strategy chart'
  # http://www.blackjackchamp.com/strategy/2-deck-chart/ 

  def derive_hint
  end
end

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

class Card
  attr_accessor :suit, :type, :value

  NUMBERS = %w(2, 3, 4, 5, 6, 7, 8, 9, 10).freeze
  FACE_CARDS = %w(King Queen Jack).freeze

  def initialize suit, type
    @suit = suit
    @type = type
    @value = value
  end

  def display_value
    @value
  end

  def value
    if NUMBERS.include? type 
      card.to_i
    elsif FACE_CARDS.include? type
      10
    elsif type == 'Ace'
      11
    end
  end
end

class Deck
  attr_reader :suits, :values
  attr_accessor :deck

  NUMBER_OF_DECKS = 2
  SUITS  = %w(Hearts Clubs Spades Diamonds).freeze
  VALUES = %w(Ace King Queen Jack 10 9 8 7 6 5 4 3 2).freeze

  def initialize
  end

  def generate
    deck = []
    NUMBER_OF_DECKS.times do
      deck.push(values.product suits)
    end
    deck.shuffle!
  end

  def deal
  end
end

class Game
  attr_accessor

  def initialize
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

card = Card.new 'Hearts','Ace' 
puts card.suit
puts card.type
puts card.value

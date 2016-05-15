require 'pry'

module Setup
  def get_player_count
    display 'Enter the number of players (1-4)'
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if (1-4).include? answer
    end
    answer
  end

  def get_player_names
    number_players.times do |player|
      display "Enter the name of player #{player}"
      name = nil
      loop do
        name = gets.chomp
        break if name
      end
      # create a new player object in a player array
    end
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
  attr_accessor :suit, :rank, :value

  NUMBERS = %w(2, 3, 4, 5, 6, 7, 8, 9, 10).freeze
  FACE_CARDS = %w(King Queen Jack).freeze

  def initialize rank, suit 
    @rank = rank
    @suit = suit
    @value = get_value
  end

  def get_value
    if NUMBERS.include? rank
      rank.to_i
    elsif FACE_CARDS.include? rank
      10
    elsif rank == 'Ace'
      11
    end
  end
end

class Deck
  attr_reader :suits, :values
  attr_accessor :deck, :cards

  NUMBER_OF_DECKS = 2
  SUITS  = %w(Hearts Clubs Spades Diamonds).freeze
  RANKS = %w(Ace King Queen Jack 10 9 8 7 6 5 4 3 2).freeze

  def initialize
    @deck = {}
    @cards = []
    create_cards
    build_deck
  end

  def create_cards
    suits = SUITS * 2
    NUMBER_OF_DECKS.times do
      @cards = RANKS.product suits
    end
    @cards.shuffle!
  end

  def build_deck
    cards.each_with_index do |card, key|
      @deck[key] = Card.new(card[0], card[1])
    end
  end

  def deal
  end
end

class Game
  attr_accessor

  include Setup
  include Messaging

  def initialize
  end

  def play 
    get_player_count
    get_player_names
  end
end

deck = Deck.new
binding.pry

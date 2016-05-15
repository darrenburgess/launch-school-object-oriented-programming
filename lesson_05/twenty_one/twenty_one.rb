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
    @hand = []
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
    super
    @stash = nil
  end

  def display_cards
    puts "Player's hand:"
    hand.each do |card|
      puts card.to_s
    end
    puts ''
  end

  def place_bet
  end

  def calculate_stash
  end
end

class Dealer < Participant
  attr_accessor :hidden

  def initialize
    @hidden = true
    super
  end

  def display_cards
    puts "Dealer's hand:"
    hand.each do |card|
      if hide_card?
        puts "-- hole card --"
        @hidden = false
      else
        puts card.to_s
      end
    end
    puts ''
  end

  def hide_card?
    hidden
  end

  def stick
  end
end

class Card
  attr_accessor :suit, :rank, :value

  NUMBERS = %w(2 3 4 5 6 7 8 9 10).freeze
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
    else
      11
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_accessor :deck, :cards, :card_stack

  NUMBER_OF_DECKS = 2
  SUITS  = %w(Hearts Clubs Spades Diamonds).freeze
  RANKS = %w(Ace King Queen Jack 10 9 8 7 6 5 4 3 2).freeze

  def initialize
    @deck = []
    @card_stack = []
    @cards = []
    create_cards
    build_deck
  end

  def create_cards
    suits = SUITS * 2
    NUMBER_OF_DECKS.times do
      @card_stack = RANKS.product suits
    end
    @card_stack.shuffle!
  end

  def build_deck
    card_stack.each_with_index do |card, key|
      cards[key] = Card.new(card[0], card[1])
    end
  end
end

class Game
  attr_accessor :deck, :dealer, :player

  include Setup
  include Messaging


  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def hit(participant)
    participant.hand << deck.cards.pop
  end

  def deal
    2.times do
      hit(player)
      hit(dealer)
    end
  end

  def display_cards
    player.display_cards
    dealer.display_cards
    binding.pry
  end

  def play 
    deal
    display_cards
    player_turn
    dealer_turn
  end
end

game = Game.new
game.play

require 'pry'

module UserInterface # :nodoc: 
  def clear
    system('clear') || system('cls')
  end

  def blank_line
    puts ''
  end

  def display(message)
    puts "==> #{message}"
  end
end

module Strategy # :nodoc: 
  @chart = 'create a hash of 2 deck strategy chart'
  # http://www.blackjackchamp.com/strategy/2-deck-chart/

  def derive_hint
  end
end

class Participant # :nodoc: 
  attr_accessor :hand, :score

  include UserInterface

  HIGHEST_VALUE = 21

  def initialize
    @hand = []
  end

  def score
    total = 0
    hand.each do |card|
      total += card.value
    end

    ace_value = 10 * hand.count { |card| card.rank == 'Ace' }

    if total > HIGHEST_VALUE
      total -= ace_value
    else
      total
    end
  end

  def hit(card)
    @hand << card
  end

  def discard
    @hand = []
  end

  def busted?
    score > HIGHEST_VALUE
  end
end

class Player < Participant # :nodoc: 
  attr_accessor :bank_roll

  def initialize
    super
    @bank_roll = nil
  end

  def display_cards
    blank_line
    display "Player's hand:"
    hand.each do |card|
      puts card.to_s
    end
  end

  def input
    answer = nil
    loop do
      puts '(H)it or (S)tick?'
      answer = gets.chomp.downcase[0]
      break if %(h s).include? answer
    end
    answer
  end

  def place_bet
  end

  def calculate_stash
  end
end

class Dealer < Participant # :nodoc: 
  attr_accessor :hidden

  STICKS = 17

  def initialize
    @hidden = true
    super
  end

  def display_cards
    blank_line
    puts "Dealer's hand:"
    hand.each do |card|
      if hide_card?
        puts '-- hole card --'
        @hidden = false
      else
        puts card.to_s
      end
    end
  end

  def hide_card?
    hidden
  end

  def stick?
    score >= 17
  end

  def hide
    @hidden = true
  end
end

class Card # :nodoc: 
  attr_accessor :suit, :rank, :value

  NUMBERS = %w(2 3 4 5 6 7 8 9 10).freeze
  FACE_CARDS = %w(King Queen Jack).freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = card_value
  end

  def card_value
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

class Deck # :nodoc: 
  attr_accessor :deck, :cards, :card_stack

  NUMBER_OF_DECKS = 2
  SUITS = %w(Hearts Clubs Spades Diamonds).freeze
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

class Game # :nodoc: 
  attr_accessor :deck, :dealer, :player

  include UserInterface

  HIGHEST_VALUE = 21

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def player_turn
    loop do
      player.display_cards
      display "Your score is #{player.score}"
      choice = player.input
      break if choice == 's'
      player.hit draw_card
      break if player.busted?
    end
  end

  def dealer_turn
    loop do
      dealer.hit draw_card if dealer.score <= 16
      break if dealer.busted?
      break if dealer.stick?
    end
  end

  def hit(participant)
    participant.hit draw_card
  end

  def draw_card
    deck.cards.pop
  end

  def deal
    2.times do
      hit player
      hit dealer
    end
  end

  def display_cards(participant)
    participant.display_cards
  end

  def display_score(participant)
    display "Score: #{participant.score}"
  end

  def result
    return 'You busted!' if player.busted?
    return 'You won!' if player.score > dealer.score
    return 'Dealer busted, you won!' if dealer.busted?
    return 'You lost!' if player.score <= dealer.score
  end

  def display_result
    puts result
    display_cards dealer
    display_score dealer
    display_cards player
    display_score player
  end

  def reset
    dealer.hide
    dealer.discard
    player.discard
  end

  def quit?
    display 'Play again?'
    answer = nil
    loop do
      answer = gets.chomp.chr.downcase
      break if %w(y n).include? answer
    end
    answer == 'n'
  end

  def play
    clear
    deal
    display_cards dealer
    player_turn
    dealer_turn unless player.busted?
    display_result
    reset
  end

  def start
    loop do
      play
      break if quit?
    end
    display 'Thank you for playing!'
  end
end

game = Game.new
game.start

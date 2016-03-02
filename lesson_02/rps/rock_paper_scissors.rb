require 'pry'

require './rps_rules.rb'

module Messaging
  def prompt(message)
    puts "=> #{message}"
  end
end

class RulesParse < Rules
  attr_accessor :rule, :choices, :game_choices

  def initialize(player_type = :human)
    super
    @game_choices = rules.keys.map(&:to_s)
  end

end

class Player < RulesParse
  attr_accessor :move

  include Messaging

  def initialize(player_type = :human)
    super
    @player_type = player_type
    @move = nil
  end

  def choose(choices)
    if human?
      choice = nil
      loop do
        prompt "Choose #{choices.join ", "}"
        choice = gets.chomp
        break if choices.include? choice
        prompt "Sorry, invalid choice"
      end
      self.move = choice
    else
      self.move = choices.sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame < RulesParse
  attr_accessor :human, :computer
  include Messaging

  def initialize
    super
    @human = Player.new
    @computer = Player.new(:computer)
    @rule = nil
  end

  def choose_game
    answer = nil
    loop do
      prompt "Choose from the following RPS games: #{game_choices}"
      answer = gets.chomp
      break if game_choices.include? answer
    end
    self.rule = rules[answer.to_s] 
    self.choices = rule.keys.map(&:to_s)
  end

  def clear
    system 'clear' or system 'cls'
  end

  def display_welcome_message
    prompt "Welcome to Rock, Paper, Scissors"
  end

  def display_goodbye_message
    prompt "Thank you for playing"
  end

  def win?(first, second)
    rule[first.to_sym][second.to_sym]
  end

  def determine_winner(player, computer)
    action = win?(player, computer)
    return "You win: #{player} #{action} #{computer}" if action

    action = win?(computer, player)
    return "Computer wins: #{computer} #{action} #{player}" if action

    return "Tie!!"
  end

  def play_again?
    answer = nil
    loop do
      prompt "Play again? (y or n)"
      answer = gets.chomp.downcase.chars.first
      break if %w(y n).include? answer
    end
    return true if answer == "y"
    false
  end

  def play
    clear
    display_welcome_message
    choose_game
    loop do
      human.choose(choices)
      computer.choose(choices)
      prompt determine_winner(human.move, computer.move)
      break unless play_again?
      clear
    end
    display_goodbye_message
  end
end

RPSGame.new.play

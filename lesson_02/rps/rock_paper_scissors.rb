require 'pry'

require_relative 'rps_rules.rb'

module Messaging
  def prompt(message)
    puts "=> #{message}"
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
end

class Score
  attr_accessor :score

  def increment
   score += 1
  end
end

class Player < Score
  attr_accessor :move, :name

  include Messaging

  def initialize
    super
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    prompt "What is your name?"
    loop do
      n = gets.chomp
      break unless n.empty?
    end
    self.name = n
  end

  def choose(choices)
    choice = nil
    loop do
      prompt "Choose #{choices.join ', '}"
      choice = gets.chomp.downcase
      break if choices.include? choice
      prompt "Sorry, invalid choice"
    end
    self.move = choice
  end
end

class Robot < Player
  def set_name
    self.name = %w(Chappie R2D2 C3P0 Terminator Robocop Wall-E HAL-9000 Data).sample
  end

  def choose(choices)
    self.move = choices.sample
  end
end

class RPSGame
  attr_accessor :human, :robot, :rule, :choices

  include Messaging

  def initialize
    clear
    @human = Human.new
    @robot = Robot.new
    @rule = nil
  end

  def choose_game
    answer = nil
    loop do
      prompt "Choose from the following RPS games: #{GAME_CHOICES.join ', '}"
      answer = gets.chomp
      break if GAME_CHOICES.include? answer
    end
    self.rule = RULES[answer.to_s]
    self.choices = rule.keys.map(&:to_s)
  end

  def win?(first, second)
    rule[first.to_sym][second.to_sym]
  end

  def determine_winner(player, computer)
    action = win?(player, computer)
    if action
      human.increment
      return "#{human.name} wins: #{player} #{action} #{computer}"
    end
    
    action = win?(computer, player)
    if action
      robot.increment
      return "#{robot.name} wins: #{computer} #{action} #{player}"
    end

    "Tie!! #{human.name}: #{player} #{robot.name}: #{computer}"
  end

  def play_again?
    answer = nil
    loop do
      prompt "Play again? (y or n)"
      answer = gets.chomp.downcase.chars.first
      break if %w(y n).include? answer
    end
    answer == "y"
  end

  def play
    clear
    display_welcome_message
    choose_game
    loop do
      human.choose(choices)
      robot.choose(choices)
      prompt determine_winner(human.move, robot.move)
      break unless play_again?
      clear
    end
    display_goodbye_message
  end
end

RPSGame.new.play

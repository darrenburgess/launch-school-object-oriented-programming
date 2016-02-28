require 'pry'

class Player
  attr_accessor :move
 
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
  end

  def choose
    choices = %w(rock paper scissors)
    if human?
      choice = nil
      loop do
        puts "Choose rock, paper or scissors"
        choice = gets.chomp
        break if choices.include? choice
        puts "Sorry, invalid choice"
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

class Move
  def initialize
  end
end

class Rule
  def initialize
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def clear
    system 'clear' or system 'cls'
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors"
  end

  def display_goodbye_message
    puts "Thank you for playing"
  end

  def display_winner
    puts "You chose #{human.move}"
    puts "Computer chose #{computer.move}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Play again? (y or n)"
      answer = gets.chomp.downcase.chars.first
      break if %w(y n).include? answer
    end
    return true if answer == "y"
    false
  end

  def play
    clear
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
      clear
    end
    display_goodbye_message
  end
end

RPSGame.new.play

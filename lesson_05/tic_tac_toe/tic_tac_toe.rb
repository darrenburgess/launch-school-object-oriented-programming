# frozen_string_literal: true
require 'pry'

class Array # :nodoc:
end

module Arr # :nodoc:
  refine Array do
    def joinor
      self[-1] = " or #{last}" if size > 1
      join(', ')
    end
  end
end

using Arr

class Board # :nodoc:
  attr_accessor :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Style/StringLiterals
  def draw
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Style/StringLiterals

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      result = line.map { |key| @squares[key].marker }.uniq
      if result.size == 1 && result[0] != Square::INITIAL_MARKER
        return result[0]
      end
    end
    nil
  end
end

class Square # :nodoc:
  INITIAL_MARKER = ' '.freeze

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player # :nodoc:
  attr_accessor :score, :name, :marker

  ROBOTS = %w(HAL9000 Terminator C3PO R2D2).freeze

  def initialize
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def set_human_name
    puts 'Enter your name:'
    answer = nil
    loop do
      answer = gets.chomp.strip
      break if answer
    end
    self.name = answer
  end

  def set_computer_name
    self.name = ROBOTS.sample
  end
end

module Messages # :nodoc:
  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def display_goodbye_message
    puts 'Final Score:'
    puts "  #{human.name}: #{human.score}"
    puts "  #{computer.name}: #{computer.score}"
    puts 'Thanks for playing! Goodbye!'
  end
end

class TTTGame # :nodoc:
  attr_accessor :board, :human, :computer, :current_player
  include Messages

  FIRST_TO_MOVE = 'X'.freeze
  HIGH_SCORE = 3

  def initialize
    clear
    display_welcome_message
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    human.set_human_name
    computer.set_computer_name
    set_player_markers
    @current_player = FIRST_TO_MOVE
  end

  def set_player_markers
    answer = nil
    loop do
      puts 'Choose a marker (X or O):'
      answer = gets.chomp.strip.chr.upcase
      break if %w(X O).include? answer
    end
    human.marker = answer
    computer.marker = human.marker == 'X' ? 'O' : 'X'
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def play
    clear
    display_welcome_message
    display_board

    loop do
      loop do
        current_player_moves
        set_next_player
        break if board.someone_won? || board.full?
        clear_screen_and_display_board
      end

      display_result
      increment_score
      display_score
      break if overall_winner? || !play_again?
      
      reset_game
    end

    display_goodbye_message
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  def clear
    system('clear') or system('cls')
  end

  def display_board
    puts "#{human.name}'s mark is #{human.marker}."
    puts "#{computer.name}'s mark is #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_score
    puts "#{human.name}: #{human.score}. #{computer.name}: #{computer.score}"
  end

  def current_player_moves
    human_moves    if current_player == human.marker
    computer_moves if current_player == computer.marker
  end

  def set_next_player
    self.current_player = case current_player
                          when human.marker
                            computer.marker
                          else
                            human.marker
                          end
  end

  def human_moves
    puts "Choose a square: #{board.unmarked_keys.joinor}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def find_strategic_square(mark)
    Board::WINNING_LINES.each do |line|
      result = board.squares.values_at(*line).collect(&:marker)
      if result.count(mark) == 2 && result.include?(Square::INITIAL_MARKER)
        return line[result.index(Square::INITIAL_MARKER)]
      end
    end
    nil
  end

  def computer_moves
    square = if find_strategic_square(computer.marker)
               find_strategic_square(computer.marker)
             elsif find_strategic_square(human.marker)
               find_strategic_square(human.marker)
             elsif board.squares[5].marker == Square::INITIAL_MARKER
               5
             elsif board.squares[5].marker == human.marker &&
                   board.unmarked_keys.length == 8
               [1, 3, 7, 9].sample
             else
               board.unmarked_keys.sample
             end
    board[square] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won"
    when computer.marker
      puts "#{computer.name} won"
    else
      puts 'Draw'
    end
  end

  def increment_score
    if board.winning_marker == human.marker
      human.increment_score
    elsif board.winning_marker == computer.marker
      computer.increment_score
    end
  end

  def overall_winner?
    human.score == HIGH_SCORE || computer.score == HIGH_SCORE
  end

  def human_turn?
    current_player == human.marker
  end

  def play_again?
    answer = nil
    loop do
      puts 'Do you want to play again (y or n)?'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Answer must by y or n'
    end
    answer == 'y'
  end

  def reset_game
    board.reset
    clear_screen_and_display_board
    self.current_player = FIRST_TO_MOVE
  end
end

game = TTTGame.new
game.play

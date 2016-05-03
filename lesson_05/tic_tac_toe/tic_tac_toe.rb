# frozen_string_literal: true
require 'pry'

class Array
  def joinor
    self[-1] = " or #{self.last}" if self.size > 1
    self.join(', ')
  end
end

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
      result = line.map { |i| @squares[i].marker }.uniq
      return result[0] if result.size == 1 && result[0] != ' '
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
  attr_accessor :score, :name
  attr_reader :marker

  ROBOTS = %w(HAL9000 Terminator C3PO R2D2)

  def initialize(marker)
    @marker = marker
    @score = 0
    get_name
    binding.pry
  end

  def set_score
    @score +=1
  end

  def human?
    marker == "X"
  end

  def get_name
    if human?
      puts 'Enter your name:'
      answer = nil
      loop do
        answer = gets.chomp.strip
        break if answer 
      end
      self.name = answer
    else
      self.name = ROBOTS.sample
    end
  end
end

class TTTGame # :nodoc:
  attr_accessor :board, :human, :computer, :current_player

  COMPUTER_MARKER = 'O'.freeze
  HUMAN_MARKER = 'X'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER.freeze
  HIGH_SCORE = 3

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = FIRST_TO_MOVE
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
      break if overall_winner?
 
      break unless play_again?
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
    puts "Your mark is #{human.marker}. Computer mark is #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_score
    puts "Human: #{human.score}. Computer: #{computer.score}"
  end

  def current_player_moves
    human_moves    if current_player == HUMAN_MARKER
    computer_moves if current_player == COMPUTER_MARKER
  end

  def set_next_player
    self.current_player = case current_player
                          when HUMAN_MARKER 
                            COMPUTER_MARKER
                          else
                            HUMAN_MARKER
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

  def computer_moves
    square = board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER
      puts 'You won'
    when COMPUTER_MARKER
      puts 'Computer won'
    else
      puts 'Draw'
    end
  end

  def increment_score 
    if board.winning_marker == HUMAN_MARKER
      human.set_score
    elsif board.winning_marker == COMPUTER_MARKER
      computer.set_score
    end
  end

  def overall_winner?
    human.score == HIGH_SCORE || computer.score == HIGH_SCORE 
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def display_goodbye_message
    puts "Final Score - Human: #{human.score} Computer: #{computer.score}"
    puts 'Thanks for playing! Goodbye!'
  end

  def human_turn?
    current_player == HUMAN_MARKER
  end

  def play_again?
    answer = nil
    loop do
      puts 'Do you want to play again (y or n)?'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Answer must by y or n'
    end
    true if answer == 'y'
  end

  def reset_game
    board.reset
    clear_screen_and_display_board
    self.current_player = FIRST_TO_MOVE
  end
end

game = TTTGame.new
game.play

require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 5, 9],
                   [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new}
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select {|key| @squares[key].unmarked?}
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def detect_winner_alt #original detect_winner method.  works but not as readable.
    WINNING_LINES.each do |line|
      result = line.map{|i| @squares[i].marker}.uniq
      return TTTGame::HUMAN_MARKER    if result == [TTTGame::HUMAN_MARKER] 
      return TTTGame::COMPUTER_MARKER if result == [TTTGame::COMPUTER_MARKER]
    end
    nil
  end

  def count_marker(marker, squares)
    squares.collect(&:marker).count(marker)
  end

  def detect_winner
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return TTTGame::HUMAN_MARKER    if count_marker(TTTGame::HUMAN_MARKER, squares) == 3
      return TTTGame::COMPUTER_MARKER if count_marker(TTTGame::COMPUTER_MARKER, squares) == 3
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_accessor :board, :human, :computer
  COMPUTER_MARKER = "O"
  HUMAN_MARKER = "X"

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_message(text)
    puts text
  end

  def clear
    system "clear" or system "cls"
  end

  def display_board
    clear
    puts "Your mark is #{human.marker}. Computer mark is #{computer.marker}."
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def human_moves

    puts "Choose a square: #{board.unmarked_keys.join(", ")}"
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if board.unmarked_keys.include?(choice)
      puts "Sorry, that's not a valid choice."
    end
    board.set_square_at(choice, human.marker)
  end

  def computer_moves
    choice = board.unmarked_keys.sample
    board.set_square_at(choice, computer.marker)
  end

  def display_result
    display_board

    case board.detect_winner
    when HUMAN_MARKER
      puts "You won"
    when COMPUTER_MARKER
      puts "Computer won"
    else
      puts "Draw"
    end
  end

  def play_again?
    puts "Do you want to play again (y or n)?"
    answer = gets.chomp.chr
    true if answer == "y" || answer == "Y"
  end

  def play
    clear
    display_message("Welcome to Tic Tac Toe!")
    display_board
    loop do
      human_moves
      break if board.someone_won? || board.full?

      computer_moves
      break if board.someone_won? || board.full?

      display_board
    end

    display_result

    if play_again?
      game = TTTGame.new
      game.play
    else
      display_message("Thanks for playing! Goodbye")
    end
  end
end

game = TTTGame.new
game.play



require 'pry'

class Board
  attr_accessor :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each {|key| @squares[key] = Square.new}
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

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

  def unmarked_keys
    @squares.keys.select {|key| @squares[key].unmarked?}
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      result = line.map{|i| @squares[i].marker}.uniq
      return result[0] if result.size == 1 && result[0] != " "
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
  attr_accessor :board, :human, :computer, :current_player

  COMPUTER_MARKER = "O"
  HUMAN_MARKER = "X"

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = "human"
  end

  def display_message(text)
    puts text
  end

  def clear
    system "clear" or system "cls"
  end

  def display_board
    puts "Your mark is #{human.marker}. Computer mark is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def current_player_moves
    binding.pry
    if current_player == "human"
      human_moves
      current_player = "computer"
    else
      computer_moves
      current_player = "computer"
    end
  end

  def human_moves
    puts "Choose a square: #{board.unmarked_keys.join(", ")}"
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
      puts "You won"
    when COMPUTER_MARKER
      puts "Computer won"
    else
      puts "Draw"
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end

  def display_goodbye_message
    display_message("Thanks for playing! Goodbye!")
  end

  def human_turn?
    current_player == "human"
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again (y or n)?"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Answer must by y or n"
    end
    true if answer == 'y'
  end

  def reset_game
    board.reset
    clear_screen_and_display_board
  end

  def play
    clear
    display_welcome_message
    display_board
    
    loop do
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end

      display_result

      break unless play_again?

      reset_game
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play

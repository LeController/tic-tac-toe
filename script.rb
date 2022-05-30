class TicTacToe
  def initialize()
    puts "Welcome to Tic-Tac-Toe."
  end
  
  def pick_symbols
    puts "Pick Player 1's symbol"
    @player1Symbol = gets.chomp
    
    puts "Pick Player 2's symbol"
    @player2Symbol = gets.chomp
  end

  attr_reader :player1Symbol
  attr_reader :player2Symbol

  def create_board
    puts "INITIALIZING GAME"
    @board = "1|2|3\n4|5|6\n7|8|9"
    return @board
  end

  def get_board
    puts "CURRENT BOARD"
    puts @board
    puts "\n"
  end

  def play_turn(player_symbol, grid_number)
    @board.gsub!(grid_number, player_symbol)
  end

  def check_victory(board)
    if true
    end 
  end
end


game = TicTacToe.new()

game.pick_symbols()

puts game.create_board

victory = false
while victory == false do
  while true do
    puts "PLAYER 1 (#{game.player1Symbol}): PICK A GRID SQUARE (1-9)"
    input = gets.chomp.to_i

    if input >= 1 && input <= 9
      game.play_turn(game.player1Symbol, input.to_s)
      break
    end
  end

  game.get_board

  while true do
    puts "PLAYER 2 (#{game.player2Symbol}): PICK A GRID SQUARE (1-9)"
    input = gets.chomp.to_i

    if input >= 1 && input <= 9
      game.play_turn(game.player2Symbol, input.to_s)
      break
    end
  end

  game.get_board
end
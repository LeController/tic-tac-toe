class TicTacToe
  def initialize()
    puts "Welcome to Tic-Tac-Toe."
  end
  
  def pick_symbols
    loop do
      puts "Pick Player 1's symbol"
      @player1Symbol = gets.chomp[0]
      if ['1','2','3','4','5','6','7','8','9'].include? @player1Symbol
        puts "Symbol must not be a number!"
      end
    break if !['1','2','3','4','5','6','7','8','9'].include? @player1Symbol
    end

    puts "Player 1 is #{@player1Symbol}."
    
    loop do
      puts "Pick Player 2's symbol"
      @player2Symbol = gets.chomp[0]
      if ['1','2','3','4','5','6','7','8','9'].include? @player1Symbol
        puts "Symbol must not be a number!"
      elsif @player2Symbol == @player1Symbol
        puts "Symbol must not be the same as Player 1!"
      end
    break if !['1','2','3','4','5','6','7','8','9',@player1Symbol].include? @player2Symbol
    end

    puts "Player 2 is #{@player2Symbol}."
  end

  attr_reader :player1Symbol
  attr_reader :player2Symbol

  def create_board
    puts "INITIALIZING GAME"
    @board = "1|2|3\n4|5|6\n7|8|9"
    return @board
  end

  attr_reader :board

  def get_board
    puts "CURRENT BOARD"
    puts @board
    puts "\n"
  end

  def play_turn(player_symbol, grid_number)
    @board.gsub!(grid_number, player_symbol)
  end

end

def check_victory(player_symbol, board)
  if (board[0] == player_symbol && board[2] == player_symbol && board[4] == player_symbol) ||
     (board[6] == player_symbol && board[8] == player_symbol && board[10] == player_symbol) ||
     (board[12] == player_symbol && board[14] == player_symbol && board[16] == player_symbol) ||
     (board[0] == player_symbol && board[6] == player_symbol && board[12] == player_symbol) ||
     (board[2] == player_symbol && board[8] == player_symbol && board[14] == player_symbol) ||
     (board[4] == player_symbol && board[10] == player_symbol && board[16] == player_symbol) ||
     (board[0] == player_symbol && board[8] == player_symbol && board[16] == player_symbol) ||
     (board[4] == player_symbol && board[8] == player_symbol && board[12] == player_symbol)
    puts "VICTORY for #{player_symbol}!"
    return true
  end 
end

def board_full?(board)
  ['1','2','3','4','5','6','7','8','9'].none? {|num| board.include?(num)}
end

def new_game
  game = TicTacToe.new()
  game.pick_symbols()
  puts game.create_board

  victory = false
  while victory == false do

    if !check_victory(game.player2Symbol, game.board)

      while true do
        puts "PLAYER 1 (#{game.player1Symbol}): PICK A GRID SQUARE (1-9)"
        input = gets.chomp.to_i

        if input >= 1 && input <= 9
          if game.board.include?(input.to_s)
            game.play_turn(game.player1Symbol, input.to_s)
            break
          else
            puts "SQUARE HAS ALREADY BEEN PLAYED"
          end
        end
      end
    
    else
      victory = true
      break
    end
    
    game.get_board
    
    

    if !check_victory(game.player1Symbol, game.board)

      if board_full?(game.board)
        victory = true
        puts "GAME IS TIED"
        break
      end

      while true do
        puts "PLAYER 2 (#{game.player2Symbol}): PICK A GRID SQUARE (1-9)"
        input = gets.chomp.to_i

        if input >= 1 && input <= 9
          if game.board.include?(input.to_s)
            game.play_turn(game.player2Symbol, input.to_s)
            break
          else
            puts "SQUARE HAS ALREADY BEEN PLAYED"
          end
        end
      end

    else
      victory = true
      break
    end

    game.get_board
    
  end
end

while true
  puts "\nWould you like to play Tic-Tac-Toe?"
  input = gets.chomp[0]
  if input[0].downcase == 'y'
    new_game
  else
    break
  end
end
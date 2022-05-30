puts "Welcome to Tic-Tac-Toe."

puts "Is player 1 X or O?"

symbol = pick_symbol()
puts symbol

class TicTacToe
  def initialize(player1_symbol, player2_symbol)
    @player1_symbol = player1_symbol
    @player2_symbol = player2_symbol
  end
  
  def create_board
    puts "_|_|_"
    puts "_|_|_"
    puts "_|_|_"
  end
end

def pick_symbol

  while true do
    symbol = gets.chomp.downcase

    if symbol == "x"
      puts "You are X."
      return symbol
    elsif symbol == "o"
      puts "You are O."
      return symbol
    else 
      puts "INVALID SYMBOL"
    end
  end
end




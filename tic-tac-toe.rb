class Game
	attr_reader :player, :board, :computer
	
	def initialize
		@board = board
		@player_win
		@computer_win
	end
	
	def new_move(index, player)
		@player_win = @board.player_move(index, player)
		@computer_win = @board.computer_move
	end
	
	def complete
		player_win?
		computer_win?
	end
	def player_win?
		return "Congratulations #{@player.name}, you won!" if(@player_win)
	end
	
	def computer_win?
		return "Oops #{@player.name}, you lost!" if(@computer_win)
	end
	
	
	
	
	

	
	
end

#This board can be generalized to nxn board
class Board
	attr reader :player, :computer
	def initialize
		@board = Array.new(9, nil)
		@empty_positions = [1,2,3,4,5,6,7,8,9]
		@computation_hash = [:0 => [1,3,4], :1 => [1,3], :2 => [1,2,3],
							 :3 => [1,3], :4 => [1,2,3,4], :5 => [1,3],
							 :6 => [1,2,3], :7 => [1,3], :8 => [1,3,4]]
		@rand = 0
	end
	
	def new_move(index, player)
		@empty_positions.delete(index)
		@board[index] = "X"
		return result_check(index, "XXX")
	end
	
	def computer_move
		@rand = @empty_positions.sample
		@board[rand] = "O"
		return result_check(@rand, "OOO")
	end
	
	
	
	
	private 

	result_check(value, str)
		ref = value/3 +1
		(@computation_hash[value.to_sym]).each do |i|
			case i
				when 1
					row = [value, (value+1)%(ref*3), (value+2)%(ref*3)]
				when 2
					row = [value, value || (value+2)%((ref-1)*3), (value+4) || (value+4)%((ref-1)*3)]
				when 3
					row = [value, (value+3)%9, (value+6)%9]
				when 4
					row = [value, (value+4)%12, (value+8)%12]
				else
					row = [value, value, value]
			end
			if row.join.to_s == str
				return 1
				break
			else
				return 0
			end
		end
	end
end

class Player
	attr_reader :name
	
	def initialize(name)
		@name = name
	end
end
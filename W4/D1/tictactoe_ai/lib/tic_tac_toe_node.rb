require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def switch_mark
    if @next_mover_mark == :x
      @next_mover_mark = :o 
    else
      @next_mover_mark = :x
    end
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    result = []
    self.switch_mark
    (0...3).each do |row|
      (0...3).each do |col|
        if @board[[row, col]].nil?
          dupped_board = @board.dup
          dupped_board[[row, col]] = @next_mover_mark
          result << TicTacToeNode.new(dupped_board, @next_mover_mark, [row, col])
        end
      end
    end
    result
  end

  # def inspect
  #   {"board" => @board, "prev_move" => @prev_move_pos}
  # end



 
  
  
end

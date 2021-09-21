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
    # if the opponent of the evaluator won (opponent = next_mark)
    #   losing_node for evaluator
    #   not losing_node for opponent
    # return true if @board.over? && @board.winner && evaluator == @next_mover_mark
    # return false if @board.over? && @board.winner && evaluator != @next_mover_mark

    if self.board.over?
      return self.board.won? && self.board.winner != evaluator
    end

    return false if self.board.over? && self.board.winner.nil?
    
    # next_mover
    # last move by opponent, evaluator's turn
    if evaluator == self.next_mover_mark
      children_nodes = self.children #next move = oppo
      return children_nodes.all? do |child| #next move = oppo
        child.losing_node?(evaluator)
      end
    # last move by evaluator, this is for the opponent
    else # evaluator != self.next_mover_mark
      children_nodes = self.children #next move = evaluator
      return children_nodes.any? do |child|
        child.losing_node?(evaluator)
      end
    end
  end

  def winning_node?(evaluator)
    if self.board.over?
      return self.board.won? && self.board.winner == evaluator
    end

    # return false if self.board.over? && self.board.winner.nil?
    
    # next_mover
    # last move by opponent, evaluator's turn
    if evaluator == self.next_mover_mark
      children_nodes = self.children #next move = oppo
      children_nodes.any? do |child| #next move = oppo

        child.winning_node?(evaluator)
      end
    # last move by evaluator, this is for the opponent
    else # evaluator != self.next_mover_mark
      children_nodes = self.children #next move = evaluator
      children_nodes.all? do |child|
        child.winning_node?(evaluator)
      end
    end
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

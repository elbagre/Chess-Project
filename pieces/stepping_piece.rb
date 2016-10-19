module SteppingPiece

  MOVES = []

  def moves
    self.class::MOVES.each_with_object([]) do |move, valid_moves|
      new_pos = position[0] + move[0], position[1] + move[1]
      next unless valid_move?(new_pos)

      if board.empty?(new_pos)
        valid_moves << new_pos
      elsif
        board[new_pos].color != color
        valid_moves << new_pos
      end
    end
  end
end

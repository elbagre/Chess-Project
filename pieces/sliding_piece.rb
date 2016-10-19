module SlidingPiece
  DIAGONAL_MOVES = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1]
  ]

  HORIZONTAL_MOVES = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ]

  def horizontal_moves
    HORIZONTAL_MOVES
  end

  def diagonal_moves
    DIAGONAL_MOVES
  end

  def moves
    valid_moves = []

    move_directions.each do |delta_x, delta_y|
      valid_moves.concat(move_in_direction(delta_x, delta_y))
    end

    valid_moves
  end

  def move_in_direction(delta_x, delta_y)
    cur_x, cur_y = position
    valid_moves = []
    loop do
      cur_x, cur_y = cur_x + delta_x, cur_y + delta_y
      new_pos = cur_x, cur_y
      break unless valid_move?([cur_x, cur_y])
      if board.empty?(new_pos)
        valid_moves << new_pos
      else
        valid_moves << new_pos
        break
      end
    end
    valid_moves
  end
end

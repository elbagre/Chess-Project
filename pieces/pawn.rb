require 'byebug'
require_relative "piece"

class Pawn < Piece

  WHITE_MOVES = [
    [-1, 0],
    [-1, -1],
    [-1, 1],
    [-2, 0]
  ]

  BLACK_MOVES = [
    [1, 0],
    [1, -1],
    [1, 1],
    [2, 0]
  ]

  def initialize(position, color, board)
    super(position, color, board)
    @color == :white ? @symbol = " ♟ ".colorize(:white) : @symbol = " ♟ "
  end

  def moves
    current_moves.each_with_object([]) do |move, valid_moves|
      new_pos = position[0] + move[0], position[1] + move[1]
      next unless valid_move?(new_pos)
      valid_moves << new_pos
    end
  end

  private

  def starting_position?
    if color == :white
      position[0] == 6
    else
      position[0] == 1
    end
  end

  def current_moves
    if starting_position?
      color_moves
    else
      color_moves[0..2]
    end
  end

  def color_moves
    if color == :white
      WHITE_MOVES
    else
      BLACK_MOVES
    end
  end

end

require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(position, color, board)
    super(position, color, board)
    @color == :white ? @symbol = " ♝ ".colorize(:white) : @symbol = " ♝ "
  end

  def move_directions
    diagonal_moves
  end
end

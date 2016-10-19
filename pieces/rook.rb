require_relative  'sliding_piece'
require_relative 'piece'

class Rook < Piece
  include SlidingPiece

  def initialize(position, color, board)
    super(position, color, board)
    @color == :white ? @symbol = " ♜ ".colorize(:white) : @symbol = " ♜ "
  end

  def move_directions
    horizontal_moves
  end
end

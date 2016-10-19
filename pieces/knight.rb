require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece

  include SteppingPiece

  MOVES = [
    [2, 1],
    [2, -1],
    [1, 2],
    [1, -2],
    [-1, -2],
    [-1, 2],
    [-2, -1],
    [-2, 1]
  ]

  def initialize(position, color, board)
    super(position, color, board)
    @color == :white ? @symbol = " ♞ ".colorize(:white) : @symbol = " ♞ "
  end

end

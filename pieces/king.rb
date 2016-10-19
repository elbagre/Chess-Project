require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece

  include SteppingPiece

  MOVES = [
    [-1, -1],
    [-1 , 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1]
  ]

  def initialize(position, color, board)
    super(position, color, board)
    @color == :white ? @symbol = " ♚ ".colorize(:white) : @symbol = " ♚ "
  end

end

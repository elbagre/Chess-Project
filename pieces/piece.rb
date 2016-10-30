class Piece

  attr_reader :color, :board, :symbol
  attr_accessor :position

  def initialize(position, color, board)
    @position, @color, @board = position, color, board
  end

  def move_into_check?(end_pos)
    dup_board = board.dup
    dup_board.move!(position, end_pos)
    dup_board.in_check?(color)
  end

  def valid_move?(pos)
    board.in_bounds?(pos) && (board.empty?(pos) || board[pos].color != color)
  end

end

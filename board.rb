require_relative 'pieces/null_piece'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require 'byebug'

class Board

  attr_reader :grid

  def initialize(new_board = true)
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    if new_board
      self.populate
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def move(turn_color, start_pos, end_pos)
    raise "No piece at this position" if empty?(start_pos)
    raise "Invalid move" if !self[start_pos].moves.include?(end_pos)
    raise "Cannot move into check" if self[start_pos].move_into_check?(end_pos)
    raise "Not your piece" if self[start_pos].color != turn_color
    move!(start_pos, end_pos)
  end

  def move!(start_pos, end_pos)
    if self[start_pos].moves.include?(end_pos)
      self[end_pos] = self[start_pos]
      self[end_pos].position = end_pos
      self[start_pos] = NullPiece.instance
    end
  end

  def empty?(pos)
    self[pos].class == (NullPiece)
  end

  def populate
    populate_pawns
    populate_royals
  end

  def populate_pawns
    grid[1].map!.with_index do |_, idx|
      Pawn.new([1, idx], :black, self)
    end

    grid[6].map!.with_index do |_, idx|
      Pawn.new([6, idx], :white, self)
    end
  end

  def populate_royals
    royals = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    grid[0] = royals.map.with_index do |royal, idx|
      royal.new([0, idx], :black, self)
    end

    grid[7] = royals.map.with_index do |royal, idx|
      royal.new([7, idx], :white, self)
    end
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def pieces
    @grid.flatten.reject { |square| square.class == NullPiece }
  end

  def find_king(color)
    king = pieces.find { |piece| piece.color == color && piece.class == King }
    king || (raise 'king not found')
  end

  def in_check?(color)
    king_position = find_king(color).position
    pieces.any? do |piece|
      piece.color != color && piece.moves.include?(king_position)
    end
  end

  def checkmate?(color)
    in_check?(color) && find_king(color).moves.empty?
  end

  def dup
    dup_board = Board.new(false)
    pieces.each do |piece|
      dup_piece = piece.class.new(piece.position, piece.color, dup_board)
      dup_board[piece.position] = dup_piece
    end
    dup_board
  end
end

require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  attr_reader :symbol, :color

  def initialize
    @color = :none
    @symbol = "   "
  end

  def moves
    []
  end
end

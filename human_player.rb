require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

  def make_move(board)
    move_x, move_y = nil, nil

    until move_x && move_y
      display.render

      if move_x
        puts "It is #{color}'s turn. Place where?"
        move_y = display.cursor.get_input
        display.reset! if move_y
      else
        puts "It is #{color}'s turn. Move which piece?"
        move_x = display.cursor.get_input
        display.reset! if move_x
      end
    end

    [move_x, move_y]
  end
end

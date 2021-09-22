require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    #print the board
    puts " #{(0..7).to_a.join(' ')}"
    @board.rows.each.with_index do |row,i|
      output = row.map do |piece| 
        if piece.pos == @cursor.cursor_pos
          piece.to_s.colorize(:green)
        elsif piece.color == "black"
          piece.to_s.colorize(:blue)
        elsif piece.color == "white"
          piece.to_s.colorize(:red)
        else
          "_"
        end
      end
      puts "#{i} #{output.join(' ')}"
    end
    
    @cursor.get_input
    #show the cursor, 
    #cursor.get_input
    #show the cursor
  end


end

d = Display.new(Board.new)
d.render
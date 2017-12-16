##
# day16_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'dance_move'

def process_input(input_lines)
  input_lines.first.split(',').map { |move| DanceMove.create_move(move) }
end

def solve(input)
  programs = ('a'..'p').to_a
  dance(input, programs).join
end

def dance(dance_moves, programs)
  dance_moves.each { |dance_move| programs = dance_move.dance(programs) }
  programs
end

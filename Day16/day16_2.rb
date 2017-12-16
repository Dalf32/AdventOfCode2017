##
# day16_2.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'dance_move'

def process_input(input_lines)
  input_lines.first.split(',').map { |move| DanceMove.create_move(move) }
end

def solve(input)
  programs = ('a'..'p').to_a
  seen_dances = [programs.join]
  last_dance = dance(input, programs)

  until seen_dances.first == last_dance.join
    seen_dances << last_dance.join
    last_dance = dance(input, last_dance)
  end

  seen_dances[1_000_000_000 % seen_dances.length]
end

def dance(dance_moves, programs)
  dance_moves.each { |dance_move| programs = dance_move.dance(programs) }
  programs
end

##
# day19_2.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'point'

def process_input(input_lines)
  input_lines.map(&:chomp)
end

def solve(input)
  position = Point.new(0, input.first.index('|'))
  direction = :down
  seen_letters = ''
  num_steps = 0

  loop do
    current_char = char_at(input, position)
    direction = turn(input, position, direction) if current_char == '+'
    next_position = move(position, direction)

    case char_at(input, next_position)
    when ' '
      num_steps += 1
      break
    when '+', '-', '|'
      nil
    when /[a-z]/i
      seen_letters << char_at(input, next_position)
    end

    num_steps += 1
    position = next_position
  end

  num_steps
end

def move(position, direction)
  case direction
  when :up
    position + Point.new(-1, 0)
  when :down
    position + Point.new(1, 0)
  when :left
    position + Point.new(0, -1)
  when :right
    position + Point.new(0, 1)
  end
end

def char_at(diagram, position)
  diagram[position.x][position.y]
end

def turn(diagram, position, direction)
  if direction == :up || direction == :down
    left_char = char_at(diagram, move(position, :left))
    return :left if left_char == '-'
    :right
  else
    up_char = char_at(diagram, move(position, :up))
    return :up if up_char == '|'
    :down
  end
end

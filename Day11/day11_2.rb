##
# day11_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.split(',')
end

def solve(input)
  max_distance = 0
  pos = [0, 0]

  input.each do |direction|
    pos[0] += 1 if direction.include?('e')
    pos[0] -= 1 if direction.include?('w')
    pos[1] += 1 if direction.include?('n')
    pos[1] -= 1 if direction.include?('s')

    max_distance = [max_distance, pos.map(&:abs).max].max
  end

  max_distance
end
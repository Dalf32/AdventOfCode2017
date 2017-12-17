##
# day17_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.to_i
end

def solve(input)
  current_index = 0
  buffer = [0]

  2017.times do |value|
    current_index = (current_index + input) % buffer.length + 1
    buffer = buffer.insert(current_index, value + 1)
  end

  buffer[current_index + 1]
end

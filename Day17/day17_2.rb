##
# day17_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.to_i
end

def solve(input)
  current_index = 0
  buffer_length = 1
  target_value = 0

  50_000_000.times do |value|
    current_index = (current_index + input) % buffer_length + 1
    buffer_length += 1
    target_value = value + 1 if current_index == 1
  end

  target_value
end

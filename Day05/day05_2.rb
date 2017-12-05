##
# day05_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.map(&:chomp).map(&:to_i)
end

def solve(input)
  cur_index = 0
  step_count = 0

  while cur_index.between?(0, input.length - 1)
    next_index = cur_index + input[cur_index]

    if input[cur_index] >= 3
      input[cur_index] -= 1
    else
      input[cur_index] += 1
    end

    cur_index = next_index
    step_count += 1
  end

  step_count
end

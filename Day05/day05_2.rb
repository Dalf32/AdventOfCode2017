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
    cur_index = jump_instruction(input, cur_index)
    step_count += 1
  end

  step_count
end

def jump_instruction(instructions, cur_index)
  next_index = cur_index + instructions[cur_index]

  if instructions[cur_index] >= 3
    instructions[cur_index] -= 1
  else
    instructions[cur_index] += 1
  end

  next_index
end

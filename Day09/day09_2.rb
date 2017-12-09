##
# day09_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp
end

def solve(input)
  in_garbage = false
  should_skip = false
  garbage_count = 0

  input.chars.each do |char|
    if should_skip
      should_skip = false
      next
    end

    if in_garbage
      should_skip = char == '!'
      in_garbage = char != '>'
      garbage_count += 1 unless %w[> !].include?(char)
    else
      in_garbage = char == '<'
    end
  end

  garbage_count
end

##
# day03_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.to_i
end

def solve(input)
  layer = find_layer(input)
  length = layer_size(layer)
  offset = find_offset(input, length)

  offset + layer
end

def find_layer(square)
  root = Math.sqrt(square)

  if root.to_i.odd?
    return (root.to_i - 1) / 2 if root == root.truncate
    return (root.to_i + 1) / 2
  end

  root.to_i / 2
end

def layer_size(layer)
  1 + (2 * layer)
end

def find_offset(square, length)
  [1, 3, 5, 7].map { |n| square - (length**2 - (length / 2 * n)) }
              .map(&:abs).min
end

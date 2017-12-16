##
# day03_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.to_i
end

def solve(input)
  latest_layer = [[1], [1], [1], [1]]
  target_found = false
  layer_num = 1

  until target_found
    layer_size = layer_size(layer_num)
    latest_layer = gen_layer(latest_layer, layer_size)
    layer_num += 1

    target_found = !latest_layer.flatten.select { |val| val > input }.empty?
  end

  latest_layer.flatten.select { |val| val > input }.min
end

def layer_size(layer)
  1 + (2 * layer)
end

def gen_side(prev_layer, cur_layer, side_num, layer_size)
  prev_side = prev_layer[side_num]
  new_side = [0]
  new_side = [cur_layer[side_num - 1][-1]] unless (side_num - 1).negative?

  prev_corner = (side_num - 1).negative? ? 0 : cur_layer[side_num - 1][-2]
  next_corner = side_num == 3 ? cur_layer[0][1] : 0

  (0..(layer_size - 2)).to_a.each do |i|
    n1 = (i - 1).negative? ? prev_corner : prev_side[i - 1]
    n2 = i >= prev_side.length ? 0 : prev_side[i]
    n3 = i + 1 >= prev_side.length ? next_corner : prev_side[i + 1]
    new_side << new_side[i] + n1 + n2 + n3
  end

  new_side
end

def gen_layer(prev_layer, layer_size)
  new_layer = []

  (0..3).to_a.each do |side_num|
    new_layer << gen_side(prev_layer, new_layer, side_num, layer_size)
  end

  new_layer[0][0] = new_layer[-1][-1]
  new_layer
end

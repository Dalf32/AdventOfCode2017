##
# day22_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'point'

def process_input(input_lines)
  input_lines.map(&:chomp)
end

def solve(input)
  position = Point.new(input.size / 2, input.size / 2)
  move_directions = [Point.new(-1, 0), Point.new(0, 1),
                     Point.new(1, 0), Point.new(0, -1)]
  facing = 0
  infected_nodes = 0
  other_nodes = {}

  10_000.times do
    node_state = network(input, other_nodes, position)

    if node_state == '.'
      network_set(input, other_nodes, position, '#')
      infected_nodes += 1
      facing = (facing - 1) % 4
    else
      network_set(input, other_nodes, position, '.')
      facing = (facing + 1) % 4
    end

    position += move_directions[facing]
  end

  infected_nodes
end

def network(start_nodes, saved_nodes, position)
  if position.in_bounds?(0, 24)
    start_nodes[position.x][position.y]
  elsif saved_nodes.key?(position)
    saved_nodes[position]
  else
    '.'
  end
end

def network_set(start_nodes, saved_nodes, position, new_state)
  if position.in_bounds?(0, 24)
    start_nodes[position.x][position.y] = new_state
  else
    saved_nodes[position] = new_state
  end
end

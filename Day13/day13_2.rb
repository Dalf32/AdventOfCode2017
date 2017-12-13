##
# day13_2.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'layer'

def process_input(input_lines)
  input_lines.map { |layer| Layer.parse(layer.chomp) }
end

def solve(input)
  max_layer = input.last.depth
  layer_map = input.map { |layer| [layer.depth, layer] }.to_h
  delay = 1

  until can_traverse_firewall?(layer_map, max_layer, delay)
    delay += 1
    layer_map.values.each(&:reset)
  end

  delay
end

def can_traverse_firewall?(layer_map, max_layer, delay)
  (0..max_layer).each do |layer|
    cur_tick = delay + layer
    return false if layer_map[layer]&.caught_at_tick?(cur_tick)
  end

  true
end

##
# day13_1.rb
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

  caught_layers = traverse_firewall(layer_map, max_layer)
  caught_layers.map { |layer| layer_map[layer].severity }.reduce(&:+)
end

def traverse_firewall(layer_map, max_layer)
  caught_layers = []

  (0..max_layer).each do |layer|
    caught_layers << layer if layer_map.key?(layer) && layer_map[layer].caught?

    layer_map.values.each(&:tick)
  end

  caught_layers
end

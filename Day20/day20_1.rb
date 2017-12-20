##
# day20_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'particle'

def process_input(input_lines)
  input_lines.map(&:chomp).map
             .with_index { |particle_str, i| Particle.parse(particle_str, i) }
end

def solve(input)
  input.sort_by(&:acceleration_magnitude).first.particle_num
end

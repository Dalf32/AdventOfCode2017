##
# day15_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'generator'

def process_input(input_lines)
  divisor = 2_147_483_647
  [Generator.new(input_lines.first.split.last.to_i, 16_807, divisor),
   Generator.new(input_lines.last.split.last.to_i, 48_271, divisor)]
end

def solve(input)
  gen_a = input.first
  gen_b = input.last
  num_matches = 0

  40_000_000.times do
    a_bits = gen_a.generate.last_bits(16)
    b_bits = gen_b.generate.last_bits(16)
    num_matches += 1 if a_bits == b_bits
  end

  num_matches
end

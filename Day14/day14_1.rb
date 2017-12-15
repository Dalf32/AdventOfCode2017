##
# day14_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'knot_hash'

def process_input(input_lines)
  input_lines.first.chomp
end

def solve(input)
  (0..127).map do |row|
    hash_val = generate_hash(to_hash_bits(input, row))
    hash_val.hex.to_s(2).count('1')
  end.reduce(&:+)
end

def to_hash_bits(input_str, row_num)
  "#{input_str}-#{row_num}".chars.map(&:codepoints).map(&:first) +
    [17, 31, 73, 47, 23]
end

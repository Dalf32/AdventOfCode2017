##
# day02_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.map { |line| line.chomp.split("\t").map(&:to_i) }
end

def solve(input)
  row_results = input.map do |row|
    row.combination(2).select { |a, b| (a % b).zero? || (b % a).zero? }
       .map { |pair| pair.max / pair.min }
  end

  row_results.flatten.reduce { |sum, x| sum + x }
end

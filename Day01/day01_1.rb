##
# day01_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  first_line = input_lines.first.chomp
  (first_line[0..-1] + first_line[0..0]).chars
end

def solve(input)
  input.chunk_while { |a, b| a == b }
       .select { |run| run.length > 1 }
       .map { |run| run.first.to_i * (run.length - 1) }
       .reduce { |sum, run_total| sum + run_total }
end

puts solve(process_input(open(ARGV.shift).readlines))

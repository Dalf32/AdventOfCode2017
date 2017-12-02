##
# day01_1.rb
#
# AUTHOR::  Kyle Mullins
##

def solve(input)
  (input[0..-1] + input[0..0]).chars.chunk_while { |a, b| a == b }
                              .select { |run| run.length > 1 }
                              .map { |run| run.first.to_i * (run.length - 1) }
                              .reduce { |sum, run_total| sum + run_total }
end

puts solve(open(ARGV.shift).readline.chomp)

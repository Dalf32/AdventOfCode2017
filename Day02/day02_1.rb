##
# day02_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.map { |line| line.chomp.split("\t").map(&:to_i) }
end

def solve(input)
  input.map { |row| row.max - row.min }
       .reduce { |sum, row_diff| sum + row_diff }
end

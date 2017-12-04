##
# day04_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.map(&:chomp).map(&:split)
end

def solve(input)
  input.select { |words| words.uniq.length == words.length }.length
end

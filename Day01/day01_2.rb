##
# day01_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.chars
end

def solve(input)
  distance = input.length / 2
  input.select.with_index { |digit, i| digit == input[(i + distance) % input.length] }
       .map(&:to_i).reduce { |sum, digit| sum + digit }
end

puts solve(process_input(open(ARGV.shift).readlines))

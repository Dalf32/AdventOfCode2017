##
# day07_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'program'

def process_input(input_lines)
  input_lines.map { |line| Program.parse(line.chomp) }
end

def solve(input)
  program_map = input.map { |program| [program.name, program] }.to_h
  program_map.each { |_, program| program.resolve_children(program_map) }

  program_map.values.find { |program| !program.has_parent? }
end

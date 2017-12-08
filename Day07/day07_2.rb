##
# day07_2.rb
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

  node = program_map.values.reject(&:balanced?).sort_by(&:total_weight).first
  child_weights = node.children.map(&:total_weight)
  offender = node.children.find { |child| child_weights.count(child.total_weight) == 1 }
  target_weight = (child_weights - [offender.total_weight]).first
  offender.weight + (target_weight - offender.total_weight)
end

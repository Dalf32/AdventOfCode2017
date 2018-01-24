##
# day23_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'part1/instruction'
require_relative 'part1/coprocessor_program'

def process_input(input_lines)
  input_lines.map { |instr| Part1::Instruction.create_instruction(instr.chomp) }
end

def solve(input)
  program = Part1::CoprocessorProgram.new
  program.run(input)
  program.multiply_count
end

##
# day18_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'instruction'
require_relative 'sound_card_program'

def process_input(input_lines)
  input_lines.map { |instr| Instruction.create_instruction(instr.chomp) }
end

def solve(input)
  SoundCardProgram.new(input).run
end

##
# day18_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'part1/instruction'
require_relative 'part1/sound_card_program'

def process_input(input_lines)
  input_lines.map { |instr| Part1::Instruction.create_instruction(instr.chomp) }
end

def solve(input)
  Part1::SoundCardProgram.new(input).run
end

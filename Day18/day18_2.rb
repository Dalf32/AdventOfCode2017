##
# day18_2.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'part2/instruction'
require_relative 'part2/sound_card_program'
require_relative 'part2/channel'

def process_input(input_lines)
  input_lines.map { |instr| Part2::Instruction.create_instruction(instr.chomp) }
end

def solve(input)
  channel = Part2::Channel.new(0, 1)
  program0 = Part2::SoundCardProgram.new(0, channel, input)
  program1 = Part2::SoundCardProgram.new(1, channel, input)

  until program0.waiting? && program1.waiting?
    program0.run_step
    program1.run_step
  end

  program1.send_count
end

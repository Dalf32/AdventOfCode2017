##
# sound_card_program.rb
#
# AUTHOR::  Kyle Mullins
##

class SoundCardProgram
  attr_reader :last_frequency

  def initialize(instructions)
    @instructions = instructions
    @registers = Hash.new(0)
    @last_frequency = 0
    @next_instruction = 0
    @should_end = false
  end

  def run
    instruction_pointer = 0
    retval = 0

    until @should_end
      @next_instruction = instruction_pointer + 1
      retval = @instructions[instruction_pointer].execute(self)
      instruction_pointer = @next_instruction
    end

    retval
  end

  def end
    @should_end = true
  end

  def play_sound(frequency)
    @last_frequency = frequency
  end

  def register(reg)
    @registers[reg]
  end

  def set_register(reg, value)
    @registers[reg] = value
  end

  def value_of(value)
    return register(value) if @registers.key?(value)
    value.to_i
  end

  def jump(offset)
    @next_instruction = (@next_instruction - 1) + offset
  end
end

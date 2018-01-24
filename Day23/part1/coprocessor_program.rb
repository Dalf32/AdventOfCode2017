# coprocessor_program.rb
#
# AUTHOR::  Kyle Mullins

require_relative 'instruction'

module Part1
  class CoprocessorProgram
    attr_reader :multiply_count

    def initialize
      @registers = Hash.new(0)
      @next_instruction = 0
      @multiply_count = 0
    end

    def run(instructions)
      instruction_pointer = 0

      until instruction_pointer >= instructions.length
        @next_instruction = instruction_pointer + 1

        instructions[instruction_pointer].execute(self)
        @multiply_count += 1 if instructions[instruction_pointer].is_a?(Instruction::Multiply)

        instruction_pointer = @next_instruction
      end
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
end

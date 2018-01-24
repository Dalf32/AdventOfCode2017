# instruction.rb
#
# AUTHOR::  Kyle Mullins

module Part1
  module Instruction
    def self.create_instruction(instr)
      instr_name, *args = *instr.split

      case instr_name
        when 'set'
          Set.new(*args)
        when 'sub'
          Subtract.new(*args)
        when 'mul'
          Multiply.new(*args)
        when 'jnz'
          Jump.new(*args)
      end
    end

    class Set
      def initialize(register, value)
        @register = register
        @value = value
      end

      def execute(program)
        program.set_register(@register, program.value_of(@value))
      end
    end

    class Subtract
      def initialize(register, value)
        @register = register
        @value = value
      end

      def execute(program)
        new_value = program.register(@register) - program.value_of(@value)
        program.set_register(@register, new_value)
      end
    end

    class Multiply
      def initialize(register, value)
        @register = register
        @value = value
      end

      def execute(program)
        new_value = program.register(@register) * program.value_of(@value)
        program.set_register(@register, new_value)
      end
    end

    class Jump
      def initialize(test_value, offset_value)
        @test_value = test_value
        @offset_value = offset_value
      end

      def execute(program)
        offset = program.value_of(@offset_value)
        program.jump(offset) unless program.value_of(@test_value).zero?
      end
    end
  end
end

##
# instruction.rb
#
# AUTHOR::  Kyle Mullins
##

module Part2
  module Instruction
    def self.create_instruction(instr)
      instr_name, *args = *instr.split

      case instr_name
      when 'snd'
        Send.new(*args)
      when 'set'
        Set.new(*args)
      when 'add'
        Add.new(*args)
      when 'mul'
        Multiply.new(*args)
      when 'mod'
        Modulo.new(*args)
      when 'rcv'
        Receive.new(*args)
      when 'jgz'
        Jump.new(*args)
      end
    end

    class Send
      def initialize(value)
        @value = value
      end

      def execute(program)
        program.send_msg(program.value_of(@value))
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

    class Add
      def initialize(register, value)
        @register = register
        @value = value
      end

      def execute(program)
        new_value = program.register(@register) + program.value_of(@value)
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

    class Modulo
      def initialize(register, value)
        @register = register
        @value = value
      end

      def execute(program)
        new_value = program.register(@register) % program.value_of(@value)
        program.set_register(@register, new_value)
      end
    end

    class Receive
      def initialize(register)
        @register = register
      end

      def execute(program)
        value = program.receive_msg
        program.set_register(@register, value) unless value.nil?
      end
    end

    class Jump
      def initialize(value_a, value_b)
        @value_a = value_a
        @value_b = value_b
      end

      def execute(program)
        offset = program.value_of(@value_b)
        program.jump(offset) if program.value_of(@value_a).positive?
      end
    end
  end
end

##
# sound_card_program.rb
#
# AUTHOR::  Kyle Mullins
##

module Part2
  class SoundCardProgram
    attr_reader :send_count

    def initialize(program_id, com_channel, instructions)
      @program_id = program_id
      @com_channel = com_channel
      @instructions = instructions
      @registers = Hash.new(0)
      @instruction_pointer = 0
      @next_instruction = 0
      @send_count = 0
      @waiting = false

      @registers['p'] = @program_id
    end

    def run_step
      @waiting = false
      @next_instruction = @instruction_pointer + 1
      retval = @instructions[@instruction_pointer].execute(self)
      @instruction_pointer = @next_instruction

      retval
    end

    def waiting?
      @waiting
    end

    def send_msg(value)
      @send_count += 1
      @com_channel.send_msg(@program_id, value)
    end

    def receive_msg
      if @com_channel.message_available?(@program_id)
        @com_channel.receive_msg(@program_id)
      else
        @waiting = true
        jump(0)
        nil
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

    def to_s
      "Program #{@program_id} @#{@instruction_pointer}; waiting? #{waiting?}, send_count = #{send_count}"
    end
  end
end

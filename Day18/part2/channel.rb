##
# channel.rb
#
# AUTHOR::  Kyle Mullins
##

module Part2
  class Channel
    def initialize(program_id_a, program_id_b)
      @inboxes = { program_id_a => [], program_id_b => [] }
      @outboxes = { program_id_a => @inboxes[program_id_b],
                    program_id_b => @inboxes[program_id_a] }
    end

    def send_msg(program_id, value)
      @outboxes[program_id] << value
    end

    def receive_msg(program_id)
      @inboxes[program_id].shift
    end

    def message_available?(program_id)
      !@inboxes[program_id].empty?
    end
  end
end

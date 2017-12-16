##
# dance_move.rb
#
# AUTHOR::  Kyle Mullins
##

module DanceMove
  def self.create_move(move)
    case move[0]
    when 's'
      Spin.new(move[1..-1].to_i)
    when 'x'
      Exchange.new(*move[1..-1].split('/').map(&:to_i))
    when 'p'
      Partner.new(*move[1..-1].split('/'))
    end
  end

  class Spin
    def initialize(num_programs)
      @num_programs = num_programs
    end

    def dance(programs)
      programs[-@num_programs..-1] + programs[0..-(@num_programs + 1)]
    end
  end

  class Exchange
    def initialize(position_a, position_b)
      @position_a = position_a
      @position_b = position_b
    end

    def dance(programs)
      prog_a = programs[@position_a]
      programs[@position_a] = programs[@position_b]
      programs[@position_b] = prog_a
      programs
    end
  end

  class Partner
    def initialize(program_a, program_b)
      @program_a = program_a
      @program_b = program_b
    end

    def dance(programs)
      programs.map do |program|
        case program
        when @program_a
          @program_b
        when @program_b
          @program_a
        else
          program
        end
      end
    end
  end
end

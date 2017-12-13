##
# layer.rb
#
# AUTHOR::  Kyle Mullins
##

class Layer
  attr_reader :depth

  def self.parse(input_line)
    depth, range = *input_line.split(': ').map(&:to_i)
    Layer.new(depth, range)
  end

  def initialize(depth, range)
    @depth = depth
    @range = range
    reset
  end

  def severity
    @depth * @range
  end

  def reset
    @scanner_pos = 1
    @increment = 1
  end

  def tick
    @increment *= -1 unless (@scanner_pos + @increment).between?(1, @range)
    @scanner_pos += @increment
  end

  def sim_ticks(num_ticks)
    (num_ticks % sequence_length).times { tick }
  end

  def caught?
    @scanner_pos == 1
  end

  def caught_at_tick?(tick_num)
    (tick_num % sequence_length).zero?
  end

  private

  def sequence_length
    (@range - 1) * 2
  end
end

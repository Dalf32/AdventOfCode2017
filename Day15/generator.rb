##
# generator.rb
#
# AUTHOR::  Kyle Mullins
##

class Generator
  def initialize(start_val, factor, divisor, criteria = 1)
    @current_value = start_val
    @factor = factor
    @divisor = divisor
    @criteria = criteria
  end

  def generate
    @current_value = (@current_value * @factor) % @divisor
    self
  end

  def generate_by_criteria
    generate
    generate until (@current_value % @criteria).zero?
    self
  end

  def last_bits(num_bits)
    @current_value.to_s(2)[-num_bits..-1]
  end
end

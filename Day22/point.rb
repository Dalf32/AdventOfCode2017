##
# point.rb
#
# AUTHOR::  Kyle Mullins
##

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance
    @x.abs + @y.abs
  end

  def in_bounds?(min, max)
    @x.between?(min, max) && @y.between?(min, max)
  end

  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    to_s.hash
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

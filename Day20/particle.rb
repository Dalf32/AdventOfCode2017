##
# particle.rb
#
# AUTHOR::  Kyle Mullins
##

require 'matrix'

class Particle
  attr_reader :particle_num, :position

  def self.parse(particle_str, particle_num)
    vector_strs = particle_str.split(/[<>]/)
    position = parse_vector(vector_strs[1])
    velocity = parse_vector(vector_strs[3])
    acceleration = parse_vector(vector_strs[5])

    Particle.new(particle_num, position, velocity, acceleration)
  end

  def self.parse_vector(vector_str)
    Vector[*vector_str.split(',').map(&:to_i)]
  end

  def initialize(particle_num, position, velocity, acceleration)
    @particle_num = particle_num
    @position = position
    @velocity = velocity
    @acceleration = acceleration
  end

  def tick
    @velocity += @acceleration
    @position += @velocity
  end

  def distance
    @position.map(&:abs).reduce(&:+)
  end

  def acceleration_magnitude
    @acceleration.magnitude
  end

  def collides_with?(other_particle)
    @position == other_particle.position
  end
end

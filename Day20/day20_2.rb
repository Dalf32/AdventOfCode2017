##
# day20_2.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'particle'

def process_input(input_lines)
  input_lines.map(&:chomp).map
             .with_index { |particle_str, i| Particle.parse(particle_str, i) }
end

def solve(input)
  no_collision_ticks = 0
  particles = input

  until no_collision_ticks == 10
    particles.each(&:tick)
    collisions = particles.each_with_index.reduce([]) do |colls, (particle, i)|
      cur_collisions = find_collisions(particle, particles[(i + 1)..-1])

      if cur_collisions.empty?
        colls
      else
        colls + cur_collisions + [particle]
      end
    end

    no_collision_ticks = collisions.empty? ? no_collision_ticks + 1 : 0
    particles -= collisions
  end

  particles.count
end

def find_collisions(particle, other_particles)
  other_particles.select { |p2| particle.collides_with?(p2) }
end

##
# day06_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.split.map(&:to_i)
end

def solve(input)
  seen_configs = []
  latest_config = input

  until seen_configs.include?(latest_config)
    seen_configs << latest_config
    latest_config = redistribute_config(latest_config)
  end

  seen_configs.length - seen_configs.index(latest_config)
end

def redistribute_config(config)
  max_bank = config.index(config.max)
  distribution = config[max_bank] / config.length
  dist_remainder = config[max_bank] % config.length

  new_config = config.dup
  new_config[max_bank] = 0

  if distribution.zero?
    dist_remainder.times do |n|
      cur_index = (max_bank + n + 1) % config.length
      new_config[cur_index] += 1
    end
  else
    new_config = new_config.map { |bank| bank + distribution }
    new_config[max_bank] = dist_remainder unless dist_remainder.zero?
  end

  new_config
end

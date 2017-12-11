##
# day11_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.split(',')
end

def solve(input)
  direction_counts = %w[nw n ne se s sw]
                     .map { |dir| [dir, input.count(dir)] }.to_h
  n_s_diff = direction_counts['n'] - direction_counts['s']
  ne_sw_diff = direction_counts['ne'] - direction_counts['sw']
  nw_se_diff = direction_counts['nw'] - direction_counts['se']

  total_north = n_s_diff + ne_sw_diff + nw_se_diff
  total_east = ne_sw_diff - nw_se_diff

  [total_north.abs, total_east.abs].max
end
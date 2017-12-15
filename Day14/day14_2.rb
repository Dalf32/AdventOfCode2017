##
# day14_2.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'knot_hash'

def process_input(input_lines)
  input_lines.first.chomp
end

def solve(input)
  grid = (0..127).map do |row|
    hash_val = generate_hash(to_hash_bits(input, row))
    hash_val.hex.to_s(2).rjust(128, '0')
  end

  groups = Array.new(128) { Array.new(128, 0) }
  next_group = 1

  grid.each.with_index do |row_val, row|
    row_val.chars.each_index do |col|
      next_group = color_group(row, col, grid, groups, next_group)
      # next_group = groups.flatten.max + 1
    end
  end

  next_group - 1
end

def to_hash_bits(input_str, row_num)
  "#{input_str}-#{row_num}".chars.map(&:codepoints).map(&:first) +
    [17, 31, 73, 47, 23]
end

def color_group(row, col, grid, groups, next_group)
  return next_group if grid[row][col] == '0'
  return next_group unless groups[row][col].zero?

  priors = get_prior_neighbors(row, col)
  all_neighbors = priors + get_future_neighbors(row, col)

  prior_groups = priors.map { |r, c| groups[r][c] }.reject(&:zero?)
  group_num = prior_groups.empty? ? next_group : prior_groups.first
  groups[row][col] = group_num

  all_neighbors.each { |r, c| color_group(r, c, grid, groups, group_num) }

  prior_groups.empty? ? next_group + 1 : next_group
end

def get_prior_neighbors(row, col)
  [[row - 1, col], [row, col - 1]]
    .select { |r, c| r.between?(0, 127) && c.between?(0, 127) }
end

def get_future_neighbors(row, col)
  [[row + 1, col], [row, col + 1]]
    .select { |r, c| r.between?(0, 127) && c.between?(0, 127) }
end

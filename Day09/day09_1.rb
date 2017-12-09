##
# day09_1.rb
#
# AUTHOR::  Kyle Mullins
##

require_relative 'group'

def process_input(input_lines)
  input_lines.first.chomp
end

def solve(input)
  group_chars = []
  in_garbage = false
  should_skip = false

  input.chars.each do |char|
    if should_skip
      should_skip = false
      next
    end

    if in_garbage
      should_skip = char == '!'
      in_garbage = char != '>'
    else
      in_garbage = char == '<'
      group_chars << char if %w[{ }].include?(char)
    end
  end

  create_groups(group_chars).sum_child_scores
end

def create_groups(group_chars, enclosing_group = nil)
  head, *tail = group_chars

  return create_groups(tail, Group.new(enclosing_group)) if head == '{'
  return enclosing_group if tail.empty?
  enclosing_group.score
  create_groups(tail, enclosing_group.parent)
end

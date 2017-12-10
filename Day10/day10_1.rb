##
# day10_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.first.chomp.split(',').map(&:to_i)
end

def solve(input)
  list_size = 256
  list = (0..(list_size - 1)).to_a
  position = 0
  skip_size = 0

  input.each do |length|
    list = twist_knot(list, position, length)

    position = calculate_new_position(position, length, list_size, skip_size)
    skip_size += 1
  end

  list[0..1].reduce(&:*)
end

def twist_knot(list, position, length)
  sublist_end = position + length - 1
  sublist_overflow = sublist_end - list.length

  sublist = list[position..sublist_end]
  sublist += list[0..sublist_overflow] unless sublist_overflow < 0
  sublist = sublist.reverse

  replace_sublist(list, position, sublist)
end

def replace_sublist(list, index, sublist)
  if index + sublist.length > list.length
    overflow = index + sublist.length - list.length
    new_list = sublist[-overflow..-1] + list[overflow..(index - 1)]
    new_list + sublist[0..-(overflow + 1)]
  else
    new_list = []
    new_list = list[0..(index - 1)] unless index.zero?
    new_list += sublist
    new_list + list[(index + sublist.length)..-1]
  end
end

def calculate_new_position(position, length, list_size, skip_size)
  new_position = position + length
  new_position -= list_size if new_position > list_size
  (new_position + skip_size) % list_size
end

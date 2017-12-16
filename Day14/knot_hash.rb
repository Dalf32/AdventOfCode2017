##
# knot_hash.rb
#
# AUTHOR::  Kyle Mullins
##

def generate_hash(input)
  list_size = 256
  list = (0..(list_size - 1)).to_a
  position = 0
  skip_size = 0

  64.times do
    input.each do |length|
      list = twist_knot(list, position, length)

      position = calculate_new_position(position, length, list_size, skip_size)
      skip_size += 1
    end
  end

  list.each_slice(16).map { |block| block.reduce(&:^).to_s(16).rjust(2, '0') }.join
end

def twist_knot(list, position, length)
  sublist_end = position + length - 1
  sublist_overflow = sublist_end - list.length

  sublist = list[position..sublist_end]
  sublist += list[0..sublist_overflow] unless sublist_overflow.negative?
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

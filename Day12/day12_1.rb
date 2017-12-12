##
# day12_1.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.map(&:chomp).map { |line| line.split('<->').map(&:strip) }
             .map { |k, v| [k, v.split(', ')] }.to_h
end

def solve(input)
  group0 = ['0'] + evaluate_links(input, input['0'], ['0'])
  group0.size
end

def evaluate_links(links_hash, links, group)
  new_links = links.reject { |link| group.include?(link) }
  return [] if new_links.empty?

  new_group = group + new_links
  new_links.each do |link|
    new_links += evaluate_links(links_hash, links_hash[link], new_group)
  end

  new_links
end

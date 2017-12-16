##
# program.rb
#
# AUTHOR::  Kyle Mullins
##

class Program
  attr_reader :name, :weight, :children, :parent

  def self.parse(input_line)
    match = /([a-z]+) \((\d+)\)( -> (.+))?/.match(input_line)

    name = match[1]
    weight = match[2].to_i
    children = match[4].nil? ? [] : match[4].split(', ')

    Program.new(name, weight, children)
  end

  def initialize(name, weight, children)
    @name = name
    @weight = weight
    @child_names = children
    @children = []
    @parent = nil
  end

  def has_children?
    !@child_names.empty?
  end

  def has_parent?
    !@parent.nil?
  end

  def balanced?
    return true unless has_children?
    @children.map(&:total_weight).uniq.length == 1
  end

  def assign_parent(parent)
    @parent = parent
  end

  def resolve_children(program_map)
    @children = @child_names.map { |child| program_map[child] }
    @children.each { |child| child.assign_parent(self) }
  end

  def total_weight
    @total_weight ||= @weight + (@children.map(&:total_weight).reduce(&:+) || 0)
  end

  def inspect
    "#{@name} (#{@weight})"
  end

  def to_s
    @name
  end
end

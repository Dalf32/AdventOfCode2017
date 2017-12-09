# group.rb
#
# Author::  Kyle Mullins

class Group
  attr_reader :parent, :children

  def initialize(parent)
    @parent = parent
    @children = []

    parent.add_child(self) unless parent.nil?
  end

  def add_child(child)
    @children << child
  end

  def score
    @score ||= @parent.nil? ? 1 : @parent.score + 1
  end

  def sum_child_scores
    score + (@children.map(&:sum_child_scores).reduce(&:+) || 0)
  end
end

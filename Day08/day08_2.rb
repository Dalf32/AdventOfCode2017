##
# day08_2.rb
#
# AUTHOR::  Kyle Mullins
##

def process_input(input_lines)
  input_lines.map { |instr| instr.chomp.gsub('inc', '+').gsub('dec', '-') }
end

def solve(input)
  register_obj = setup_register_obj(input)
  max_register = 0

  input.each do |instr|
    execute_instruction(register_obj, instr)
    max_register = [max_register(register_obj), max_register].max
  end

  max_register
end

def register(instr)
  instr.split.first
end

def setup_register_obj(input)
  register_obj = Object.new
  registers = input.map { |instr| register(instr) }.uniq
  register_vars = registers.map { |reg| ':' + reg }.join(', ')

  register_obj.singleton_class.instance_eval("attr_accessor #{register_vars}")
  registers.map { |reg| register_obj.instance_eval("@#{reg} = 0") }

  register_obj
end

def execute_instruction(register_obj, instr)
  register_obj.instance_eval("@#{register(instr)} = #{instr}")
end

def max_register(register_obj)
  register_obj.instance_variables
              .map { |var| register_obj.instance_variable_get(var) }.max
end

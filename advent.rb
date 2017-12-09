##
# advent.rb
#
# AUTHOR::  Kyle Mullins
##

def format_day_num(day_num)
  format('%02i', day_num)
end

def day_exists?(day_num)
  day_str = format_day_num(day_num)
  day_folder = "Day#{day_str}"
  input_file = "#{day_folder}/day#{day_str}.input"

  Dir.exist?(day_folder) && File.exist?(input_file)
end

def part_exists?(day_num, part_num)
  day_str = format_day_num(day_num)
  part_file = "Day#{day_str}/day#{day_str}_#{part_num}.rb"

  File.exist?(part_file)
end

def run_day(day_num)
  day_str = format_day_num(day_num)
  input_file = "Day#{day_str}/day#{day_str}.input"
  input_lines = open(input_file).readlines

  puts "Day #{day_num}\n------"

  (1..2).each do |part|
    run_day_part(day_num, part, input_lines) if part_exists?(day_num, part)
  end
end

def run_day_part(day_num, part_num, input_lines)
  day_str = format_day_num(day_num)
  part_file = "Day#{day_str}/day#{day_str}_#{part_num}.rb"

  puts "  Part #{part_num}"
  # noinspection RubyResolve
  load part_file

  puts "  -> #{solve(process_input(input_lines))}\n\n"
end

def run_single_day(day_num)
  unless day_num.between?(1, 25)
    puts 'Day # must be a number between 1 and 25'
    exit(1)
  end

  unless day_exists?(day_num)
    puts "Day #{day_num} doesn't exist yet"
    exit(2)
  end

  run_day(day_num)
end

def run_latest_day
  latest_day = (1..25).to_a.reverse.find { |day_num| day_exists?(day_num) }

  if latest_day.nil?
    puts 'There are no Days yet'
    exit(3)
  end

  run_day(latest_day)
end

# MAIN
unless ARGV.empty? || ARGV.length == 1
  puts 'Usage: ruby advent.rb [Day #|latest]'
  exit(1)
end

if ARGV.length == 1
  if ARGV.first.casecmp('latest').zero?
    run_latest_day
  else
    day_num = ARGV.first.to_i
    run_single_day(day_num)
  end
else
  (1..25).each do |day|
    break unless day_exists?(day)
    run_day(day)
  end
end

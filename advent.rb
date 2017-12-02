##
# advent.rb
#
# AUTHOR::  Kyle Mullins
##

unless ARGV.empty? || ARGV.length == 1
  puts 'Usage: ruby advent.rb [Day #]'
  exit(1)
end

if ARGV.length == 1
  begin
    err = false
    day_num = Integer(ARGV.first)

    err = true unless day_num.between?(1, 25)
  rescue StandardError => e
    puts e.class
    err = true
  ensure
    if err
      puts 'Day # must be a number between 1 and 25'
      exit(1)
    end
  end
end

days = (1..25).to_a
days = [ARGV.first.to_i] if ARGV.length == 1

days.each do |day|
  day_folder = sprintf('Day%02i', day)
  break unless Dir.exist?(day_folder)

  puts "Day #{day}\n------"

  path_preamble = day_folder + "/#{day_folder.downcase}"
  input_path = path_preamble + '.input'
  break unless File.exist?(input_path)

  input_lines = open(input_path).readlines

  (1..2).each do |part|
    load_path = path_preamble + "_#{part}.rb"
    break unless File.exist?(load_path)

    puts "  Part #{part}"
    load load_path

    puts "  -> #{solve(process_input(input_lines))}\n\n"
  end
end

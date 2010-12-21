#!/usr/bin/ruby
require 'optparse'
require 'rubygems'

PWD = Dir.pwd

class Tests
  def self.run options
    orig_stdout = $stdout
    @options = options
    $stdout = File.new(options[:filename], 'w') if options[:filename]
    process_files @options[:dir]
    $stdout = orig_stdout
  end

  def self.process_files directory, depth=1
    files = Dir.entries(directory).reject do
      |file| file == "." or file == ".."
    end

    files.each do |filename|
      full_path_to_file = File.join(directory, filename)
      if File.directory? full_path_to_file
        puts_idented_file depth, full_path_to_file, '.'
        process_files full_path_to_file, depth + 1
      elsif File.executable? full_path_to_file
        puts_idented_file depth, filename, '+'
        run_test filename, directory, depth + 1 
      end
    end
  end

  def self.run_test file, directory, depth
    log_file = 
      File.join directory, "../" * (depth-1), "logs", file.gsub(".sh", "#{directory.gsub(PWD, '').gsub('/','.')}.log")
    file = File.join(directory, file)
    out_file = file.gsub ".sh", ".out"
    aux_file = file.gsub ".sh", ".aux"
    output = `#{file} #{@options[:db]}`
    expected_output = File.open(out_file).readlines.join
    if output == expected_output
      print " [\e[32mOK\e[0m]" 
    else
      print " [\e[31mFAILED\e[0m]" 
      File.open(aux_file, 'w') { |file| file.write output }
      diff = `diff #{aux_file} #{out_file}`
      File.delete aux_file
      File.open(log_file, 'w') { |file| file.write diff }
    end
    puts
  end

  def self.puts_idented_file depth, file, symbol
    depth.times { print "  " }
    print "#{symbol} #{file.gsub(PWD,'')}"
    puts if symbol == '.'
  end
end

######################################################################## Main ##
options = {}

OptionParser.new do |opts|
  opts.banner = "USAGE: runTests.rb [options]"
  opts.on("-d",
          "--directory DIR",
          String,
          "The directory you want to scan test files.") do |dir|
            options[:dir] = dir
          end
  opts.on("-o",
          "--output FILENAME",
          String,
          "The desired filename for the output file.") do |to|
            options[:filename] = to
          end
end.parse!

options[:dir] = File.join(PWD, 'api') unless options[:dir]
options[:db] = ARGV[0]

Tests.run(options)

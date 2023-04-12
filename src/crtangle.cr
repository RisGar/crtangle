require "option_parser"

def parse_blocks(file)
end

module Crtangle
  VERSION = "0.1.0"

  file = ""

  option_parser = OptionParser.parse do |parser|
    parser.banner = "ctangle - Literate programming using crystal"

    parser.on "-v", "--version", "Show version" do
      puts VERSION
      exit
    end
    parser.on "-h", "--help", "Show help" do
      puts parser
      exit
    end
    parser.on "-f", "--file", "Choose file" do |f|
      file = f
    end
    parser.missing_option do |option_flag|
      STDERR.puts "ERROR: #{option_flag} is missing something.\n\n"
      STDERR.puts ""
      STDERR.puts parser
      exit(1)
    end
    parser.invalid_option do |option_flag|
      STDERR.puts "ERROR: #{option_flag} is not a valid option.\n\n"
      STDERR.puts parser
      exit(1)
    end
  end

  blocks = parse_blocks(file)
end

require "option_parser"
require "./parse"
require "./save"

VERSION = "0.1.0"

module Crtangle
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
    parser.on "-f FILE", "--file=FILE", "Choose file" do |f|
      file = f
    end
    parser.missing_option do |option_flag|
      STDERR.puts "ERROR: #{option_flag} is missing something.\n\n"
      STDERR.puts parser
      exit(1)
    end
    parser.invalid_option do |option_flag|
      STDERR.puts "ERROR: #{option_flag} is not a valid option.\n\n"
      STDERR.puts parser
      exit(1)
    end
  end

  content = File.read(file)
  blocks = parse_blocks(content)
  target = parse_frontmatter(content)

  puts(target)
end

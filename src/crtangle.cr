require "option_parser"
require "./parse"

VERSION = "0.1.0"

def handle_file(file : String) : Nil
  content = File.read(file)
  blocks, code = parse_blocks(content)
  target = parse_frontmatter(content)

  File.write(target, code)

  puts "#{file} has been tangled to #{target} (#{blocks} blocks)."
end

module Crtangle
  option_parser = OptionParser.parse do |parser|
    parser.banner = "crtangle [file] [--help] [--version]\n"
    parser.separator("Arguments:")

    # ---
    # Args
    # ---

    parser.on "-v", "--version", "Show version" do
      puts VERSION
      exit
    end

    parser.on "-h", "--help", "Show help" do
      puts parser
      exit
    end

    parser.unknown_args do |args|
      if args.size >= 1
        handle_file(args[0])
        exit()
      else
        STDERR.puts "ERROR: Please provide a file.\n\n"
        STDERR.puts parser
        exit(1)
      end
    end

    # ---
    # Error handling
    # --

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
end

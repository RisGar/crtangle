module Crtangle
  # Handles the logic behind parsing and writing the markdown and target files.
  class Handler
    def initialize(file : String, target : String | Nil) : Nil
      content = File.read(file)

      parser = Parser.new(content)

      if target.nil?
        target = parser.frontmatter
      end

      parser.blocks

      File.write(target, parser.code)

      puts "#{file} has been tangled to #{target} (#{parser.block_count} blocks)."
    end
  end
end

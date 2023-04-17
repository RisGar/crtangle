module Crtangle
  class Parser
    @block_regex = /^(~{3,}|`{3,})/
    @delim_regex = /^(-{3})/
    @tangle_regex = /tangle:\s/
    @target_regex = /tangle:\s+([^\s]+)/

    getter block_count : Int32

    def code : String
      @code.sub(-1, "")
    end

    def initialize(@content : String)
      @block_count = 0
      @code = ""
    end

    def blocks : Nil
      block = false

      @content.each_line.each do |line|
        if line.lstrip.matches?(@block_regex)
          block = !block
          if block
            @block_count += 1
          else
            @code += "\n"
          end
          next
        end

        @code += (line + "\n") if block
      end
    end

    def frontmatter : String
      frontmatter = false

      @content.each_line.each do |line|
        if line.matches?(@delim_regex)
          frontmatter = !frontmatter
          next
        end

        if frontmatter
          if n = line.match(@target_regex)
            return n[0].sub(@tangle_regex, "")
          end
        end
      end
      ""
    end
  end
end

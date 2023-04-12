BEGINNING_REGEX = /^(~{3,}|`{3,})([a-z]+)/
END_REGEX       = /^(~{3,}|`{3,})(s*)$/

# ---
# Code Blocks
# ---

def beginning?(line : String) : Bool
  line.matches?(BEGINNING_REGEX)
end

def end?(line : String) : Bool
  line.matches?(END_REGEX)
end

def add_to_code(code, line : String) : String
  code += line + "\n"
end

def parse_blocks(content : String) : {Int32, String}
  block = false
  block_count = 0
  code = ""

  content.each_line.each do |line|
    block = false if end?(line.lstrip)

    code = add_to_code(code, line) if block

    if beginning?(line.lstrip)
      block = true
      block_count += 1
    end
  end

  {block_count, code}
end

# ---
# Frontmatter
# ---

DELIMITER_REGEX = /^(-{3})/
TANGLE_REGEX    = /tangle:\s/
TARGET_REGEX    = /tangle:\s+([^\s]+)/

def delimiter?(line : String) : Bool
  line.matches?(DELIMITER_REGEX)
end

def tangle?(line : String) : Bool
  line.matches?(TANGLE_REGEX)
end

def get_target(line : String) : String
  if n = line.match(TARGET_REGEX)
    n[0].gsub(TANGLE_REGEX, "")
  else
    STDERR.puts "ERROR: Target file could not be parsed from frontmatter."
    ""
  end
end

def parse_frontmatter(content : String) : String
  frontmatter = false
  target = ""

  content.each_line.each do |line|
    if delimiter?(line)
      frontmatter = !frontmatter
      next
    end

    if frontmatter
      target = get_target(line) if tangle?(line.lstrip)
    end
  end

  target
end

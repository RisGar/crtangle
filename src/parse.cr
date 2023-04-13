# ---
# Code Blocks
# ---

BLOCK_REGEX = /^(~{3,}|`{3,})/

def parse_blocks(content : String) : {Int32, String}
  block = false
  block_count = 0
  code = ""

  content.each_line.each do |line|
    if line.lstrip.matches?(BLOCK_REGEX)
      block = !block
      block_count += 1 if block == true
      next
    end

    code += (line + "\n") if block
  end

  {block_count, code}
end

# ---
# Frontmatter
# ---

DELIMITER_REGEX = /^(-{3})/
TANGLE_REGEX    = /tangle:\s/
TARGET_REGEX    = /tangle:\s+([^\s]+)/

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
    if line.matches?(DELIMITER_REGEX)
      frontmatter = !frontmatter
      next
    end

    if frontmatter
      target = get_target(line) if line.matches?(TANGLE_REGEX)
    end
  end

  target
end

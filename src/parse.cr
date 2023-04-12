BEGINNING_REGEX = Regex.new("^(~{3,}|`{3,})([a-z]+)")
END_REGEX       = Regex.new("^(~{3,}|`{3,})(s*)$")

def is_beginning(line : String) : Bool
  line = line.lstrip
  return line.matches?(BEGINNING_REGEX)
end

def is_end(line : String) : Bool
  line = line.lstrip
  return line.matches?(END_REGEX)
end

def add_to_code_blocks(code_block : String, line : String) : String
  return code_block += line + "\n"
end

def parse_blocks(content : String) : String
  code = false
  code_block = ""

  content.each_line.each do |line|
    if is_end(line)
      code = false
    end

    if code
      code_block = add_to_code_blocks(code_block, line)
    end

    if is_beginning(line)
      code = true
    end
  end

  return code_block
end

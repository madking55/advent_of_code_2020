example_data = File.readlines("example.txt")
input_data = File.readlines("input.txt")

def solve(input)
  valid_lines = 0
  lines = input.map { |line| line_to_hash(line)}
  lines.each do |line_hash|
    count = char_count(line_hash[:char], line_hash[:password])
    valid_lines += 1 if (line_hash[:min]..line_hash[:max]).include?(count)
  end
  valid_lines
end

def line_to_hash(line)
  range_segment, char_segment, password = line.split(' ')
  min, max = range_segment.split('-').map(&:to_i)
  char = char_segment[0]
  line_hash = {min: min, max: max, char: char, password: password}
end

def char_count(target, string)
  count = 0
  string.each_char { |char| count += 1 if char == target }
  count
end

p solve(example_data)
p solve(input_data)

example_data = File.readlines("example.txt")
input_data = File.readlines("input.txt")

# Part One

def solve_with_range(input)
  lines = input.map { |line| line_to_hash(line)}
  valid_lines = 0
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

p solve_with_range(example_data)
p solve_with_range(input_data)

# Part Two // 0(n)

def solve_with_positions(input)
  lines = input.map { |line| line_to_hash_positions(line)}
  valid_lines = 0
  lines.each do |line_hash|
    is_at_pos_1 = line_hash[:password][line_hash[:pos_1]] == line_hash[:char]
    is_at_pos_2 = line_hash[:password][line_hash[:pos_2]] == line_hash[:char]
    valid_lines += 1 if ((is_at_pos_1 || is_at_pos_2) && !(is_at_pos_1 && is_at_pos_2))
  end
  valid_lines
end

def line_to_hash_positions(line)
  range_segment, char_segment, password = line.split(' ')
  pos_1, pos_2 = range_segment.split('-').map(&:to_i)
  char = char_segment[0]
  line_hash = {pos_1: pos_1 - 1, pos_2: pos_2 - 1, char: char, password: password}
end

p solve_with_positions(example_data)
p solve_with_positions(input_data)
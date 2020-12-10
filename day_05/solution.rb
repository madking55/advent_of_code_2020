example_data = File.readlines('example.txt').map(&:chomp)
input_data = File.readlines('input.txt').map(&:chomp)

def seats_ids(input)
  input.map do |passport|
    bits = {'F' => '0', 'B' => '1', 'L' => '0', 'R' => '1'}
    passport.gsub!(/\w/, bits)
    row_as_binary, column_as_binary = [passport[0..6], passport[7..-1]]
    row = row_as_binary.to_i(2)
    column = column_as_binary.to_i(2)
    row * 8 + column
  end
end

def find_max_id(input)
  seats_ids(input).max
end

p find_max_id(example_data)
p find_max_id(input_data)


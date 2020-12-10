example_data = File.readlines('example.txt').map(&:chomp)
input_data = File.readlines('input.txt').map(&:chomp)

# Part One

def seats_ids(input)
  input.map { |seat| get_seat_id(seat) }
end

def get_seat_id(seat)
  bits = {'F' => '0', 'B' => '1', 'L' => '0', 'R' => '1'}
  seat_in_binary = seat.gsub(/\w/, bits)
  row_in_binary, column_in_binary = [seat_in_binary[0..6], seat_in_binary[7..-1]]
  row = row_in_binary.to_i(2)
  column = column_in_binary.to_i(2)
  row * 8 + column
end

def find_max_id(input)
  seats_ids(input).max
end

p find_max_id(example_data)
p find_max_id(input_data)

# Part Two

def find_my_seat_id(input)
  seats_ids(input)
  sorted_ids = seats_ids(input).sort
  for i in (1...sorted_ids.length) do 
    current_seat = sorted_ids[i]
    next_seat = sorted_ids[i + 1]
    return current_seat + 1 if current_seat + 1 != next_seat
  end
end

p find_my_seat_id(input_data)


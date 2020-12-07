require "set"

example_data = File.read("example.txt").split.map{ |s| s.to_i }
input_data = File.read("input.txt").split.map{ |s| s.to_i }

# Part One // O(n) complexity
# Find the two entries that sum to 2020; what do you get if you multiply them together?

def sum_two(expenses)
  numbers = Set.new

  expenses.each do |number| 
    difference = 2020 - number
    return number * difference if numbers.include?(difference)
    numbers.add(number)
  end
end

p sum_two(example_data) # --> 514579
p sum_two(input_data)

# Part Two // O(n2) complexity
# Find the three entries that sum to 2020; what do you get if you multiply them together?

def sum_three(expenses)
  pairs_sum = {}
  for i in 0...expenses.size
    for j in i+1...expenses.size
      num_1 = expenses[i]
      num_2 = expenses[j]
      sum = num_1 + num_2
      pairs_sum[sum] = [num_1, num_2]
    end
  end

  expenses.each do |number|
    difference = 2020 - number
    if pairs_sum.keys.include?(difference)
      num_a, num_b = pairs_sum[difference]
      return number * num_a * num_b
    end
  end
end

p sum_three(example_data)  # --> 241861950 
p sum_three(input_data)

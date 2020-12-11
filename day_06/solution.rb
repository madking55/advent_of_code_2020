require 'set'

example_data = File.read('example.txt').split("\n\n")
input_data = File.read('input.txt').split("\n\n")

def groups(input)
  input.map { |group| group.gsub(/\s/, "") }
end

def count_group_answers(group)
  group.chars.uniq.size
  # Set.new(group.chars).size
end

def count_all_groups(groups)
  groups.map { |group| count_group_answers(group)}.sum
end

def solve(data)
  count_all_groups(groups(data))
end

p solve(example_data)
p solve(input_data)
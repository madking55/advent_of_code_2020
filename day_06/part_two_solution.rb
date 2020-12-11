example_data = File.read('example.txt').split("\n\n")
input_data = File.read('input.txt').split("\n\n")

def groups(input)
  input.map { |group| group.split("\n") }
end

def count_group_answers(group)
  group.map(&:chars).reduce(&:&).size
end

def count_all_groups(groups)
  groups.map { |group| count_group_answers(group)}.sum
end

def solve(data)
  count_all_groups(groups(data))
end

p solve(example_data)
p solve(input_data)
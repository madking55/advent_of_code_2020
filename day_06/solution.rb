example_data = File.read('example.txt').split("\n\n")
input_data = File.read('input.txt').split("\n\n")

def count_anyone_in_group(data)
  groups = data.map { |group| group.gsub(/\s/, "").chars.uniq.size }
  groups.sum
end

def count_everyone_in_group(data)
  groups = data.map { |group| group.split("\n").map(&:chars).reduce(&:&).size }
  groups.sum
end

p count_anyone_in_group(example_data)
p count_everyone_in_group(example_data)

p count_anyone_in_group(input_data)
p count_everyone_in_group(input_data)
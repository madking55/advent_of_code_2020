example_data = File.read("example.txt").split("\n\n")
input_data = File.read("input.txt").split("\n\n")

example_entries = example_data.map { |entry| entry.split(/\s/) }
input_entries = input_data.map { |entry| entry.split(/\s/) }

def solve(entries)
  required_fields = %w[byr iyr eyr hgt hcl ecl pid]
  passports = entries.map { |entry| parse_entry(entry)}
  valid_passports = 0
  passports.each do |passport|
    valid_passports += 1 if required_fields.all? { |field| passport.keys.include?(field) } 
  end
  valid_passports
end


def parse_entry(entry)
  passport = {}
  entry.each do |pair|
    key, value = pair.split(':')
    passport[key] = value
  end
  passport
end


p solve(example_entries)
p solve(input_entries)


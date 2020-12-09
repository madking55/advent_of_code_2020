example_data = File.read("example.txt").split("\n\n")
input_data = File.read("input.txt").split("\n\n")

example_entries = example_data.map { |entry| entry.split(/\s/) }
input_entries = input_data.map { |entry| entry.split(/\s/) }

def count_valid_passports(entries)
  passports = entries.map { |entry| parse_entry(entry)}
  valid_passports = 0
  passports.each { |passport| valid_passports += 1 if has_all_required_fields?(passport) }
  valid_passports
end

def has_all_required_fields?(passport)
  required_fields = %w[byr iyr eyr hgt hcl ecl pid]
  required_fields.all? { |field| passport.keys.include?(field) } 
end

def parse_entry(entry)
  passport = {}
  entry.each do |pair|
    key, value = pair.split(':')
    passport[key] = value
  end
  passport
end


p count_valid_passports(example_entries)
p count_valid_passports(input_entries)


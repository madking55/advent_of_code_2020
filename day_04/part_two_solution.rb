example_data = File.read("example.txt").split("\n\n")
input_data = File.read("input.txt").split("\n\n")

example_entries = example_data.map { |entry| entry.split(/\s/) }
input_entries = input_data.map { |entry| entry.split(/\s/) }

def count_valid_passports(entries)
  passports = entries.map { |entry| parse_entry(entry)}
  valid_passports = 0
  passports.each { |passport| valid_passports += 1 if is_valid?(passport) }
  valid_passports
end

def is_valid?(passport)
  has_all_required_fields?(passport) && has_all_valid_fields?(passport)
end

def has_all_valid_fields?(passport)
  validators = [
                  valid_byr?(passport),
                  valid_ecl?(passport),
                  valid_eyr?(passport),
                  valid_hcl?(passport),
                  valid_hgt?(passport),
                  valid_iyr?(passport),
                  valid_pid?(passport)
                ]
  
  validators.all?
end

def has_all_required_fields?(passport)
  required_fields = %w[byr iyr eyr hgt hcl ecl pid]
  required_fields.all? { |field| passport.keys.include?(field) } 
end

# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.

def valid_date?(passport, key, min, max)
  value = passport[key].to_i
  (min..max).include?(value)
end

def valid_byr?(passport)
  valid_date?(passport, 'byr', 1920, 2002)
end

def valid_iyr?(passport)
  valid_date?(passport, 'iyr', 2010, 2020)
end

def valid_eyr?(passport)
  valid_date?(passport, 'eyr', 2020, 2030)
end

def valid_hgt?(passport)
  unit = passport['hgt'][-2..-1]
  value = passport['hgt'][0...-2].to_i
  if unit == 'cm'
    (150..193).include?(value)
  elsif unit == 'in'
    (50..76).include?(value)
  else
    return false
  end
end

def valid_hcl?(passport)
  passport['hcl'].match(/^#([0-9a-f]{6})$/) != nil
end

def valid_ecl?(passport)
  %w[amb blu brn gry grn hzl oth].include?(passport['ecl'])
end

def valid_pid?(passport)
  passport['pid'].match(/^([0-9]{9})$/) != nil
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



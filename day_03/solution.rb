example_data = File.readlines("example.txt").map(&:chomp)
input_data = File.readlines("input.txt").map(&:chomp)

#  Part One

def count_trees(input)
  row_index = 0
  col_index = 0
  trees_count = 0
  width = input[0].length
  while row_index < input.length - 1 
    row_index += 1
    col_index += 3
    trees_count += 1 if input[row_index][col_index % width] == '#'
  end
  trees_count
end

p count_trees(example_data)
p count_trees(input_data)


# Part Two

def multiply_trees(input)
  moves = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
  trees = 1
  moves.each do |move|
    move_right, move_down = move
    trees *= count_trees_with_moves(input, move_right, move_down)
  end
  trees
end


def count_trees_with_moves(rows, move_right, move_down)
  width = rows[0].length
  col_index = 0
  trees_count = 0
  row_index = 0
  while row_index < rows.length - 1
    row_index += move_down
    col_index += move_right
    trees_count += 1 if rows[row_index][col_index % width] == '#'
  end
  trees_count
end

p multiply_trees(example_data)
p multiply_trees(input_data)

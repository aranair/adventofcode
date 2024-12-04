matrix = []
File.open("input.txt", "r") do |file|
  file.each_line do |line|
    matrix << line.chomp.split('')
  end
end

def find(matrix)
  found = 0
  matrix.each do |a|
    s = a.join
    s.scan(/(XMAS)/) { |a| found += 1 }
    s.scan(/(SAMX)/) { |a| found += 1 }
  end

  found
end

def find_diags(matrix)
  rows = matrix.length
  # assume square?
  cols = matrix[0].length

  results = []
  (-(rows - 1)..(cols - 1)).each do |offset|
    diagonal = []
    rows.times do |r|
      c = r + offset
      diagonal << matrix[r][c] if c.between?(0, cols - 1)
    end

    results << diagonal unless diagonal.empty?
  end

  find(results)
end

total = 0
total += find(matrix)
total += find_diags(matrix)

# transpose, from column to rows
total += find(matrix.transpose)

# flip
matrix = matrix.map(&:reverse)
total += find_diags(matrix)

p total

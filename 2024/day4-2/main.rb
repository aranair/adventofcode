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
    s.scan(/(MAS)/) { |a| found += 1 }
    s.scan(/(SAM)/) { |a| found += 1 }
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

def break_matrix(matrix, sub_rows=3, sub_cols=3)
  result = []

  # Iterate over the starting rows and columns of each submatrix
  (0..(matrix.length - sub_rows)).step(1) do |start_row|
    (0..(matrix[0].length - sub_cols)).step(1) do |start_col|
      submatrix = []
      (start_row...(start_row + sub_rows)).each do |r|
        submatrix << matrix[r][start_col...(start_col + sub_cols)]
      end
      result << submatrix
    end
  end

  result
end


subs = break_matrix(matrix)
found = 0

subs.each do |sub|
  found += 1 if find_diags(sub) == 1 && find_diags(sub.map(&:reverse)) == 1
end

p found

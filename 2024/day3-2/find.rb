f = File.read("input.txt")

s = 0
disabled = false
f.scan(/don't\(\)|mul\(\d+,\d+\)|do\(\)/) do |op, _|
  disabled = true if op == "don't()"
  disabled = false if op == "do()"
  next if disabled

  op.scan(/mul\((\d+),(\d+)\)/) do |a, b|
    s += a.to_i * b.to_i
  end

end

p s

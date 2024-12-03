f = File.read("input.txt")

s = 0
f.scan(/mul\((\d+),(\d+)\)/) do |a,b|
  s += a.to_i * b.to_i
end

p s

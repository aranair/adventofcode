a = []
b = []

File.open("input.txt", "r") do |file|
  file.each_line do |line|
    c1, c2 = line.split
    a << c1
    b << c2
  end
end

a.sort!
b.sort!

s = 0
a.length.times do |i|
  s += (b[i].to_i - a[i].to_i).abs
end

p s

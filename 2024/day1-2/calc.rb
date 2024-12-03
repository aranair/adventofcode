a = []
b = []

ll = {}
lr = {}
File.open("input.txt", "r") do |file|
  file.each_line do |line|
    c1, c2 = line.split
    a << c1
    b << c2

    ll[c1] ||= 0
    ll[c1] += 1

    lr[c2] ||= 0
    lr[c2] += 1
  end
end

s = 0
a.length.times do |i|
  s += a[i].to_i * (lr[a[i]] || 0)
end

p s

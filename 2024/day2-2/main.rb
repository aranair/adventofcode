safe = 0
damp = 0

def safe?(arr)
  diffs = arr.each_cons(2).map { |a, b| (b.to_i - a.to_i) }
  if !(arr.detect{ |e| arr.count(e) > 1 }) &&
      diffs.all? { |e| (e <= 3 && e >= 1) } || diffs.all? { |e| (e <= -1 && e >= -3) }
    return true
  end

  false
end

File.open("input.txt", "r") do |file|
  file.each_line do |line|
    arr = line.split

    if safe?(arr)
      safe += 1
      next
    end

    arr.length.times do |i|
      excluded_arr = arr[0, i] + arr[i+1..-1]
      if safe?(excluded_arr)
        damp += 1
        break
      end
    end
  end
end

p safe
p damp

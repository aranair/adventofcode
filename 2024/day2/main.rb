safe = 0

File.open("input.txt", "r") do |file|
  file.each_line do |line|
    arr = line.split
    diffs_abs = arr.each_cons(2).map { |a, b| (b.to_i - a.to_i).abs }
    diffs = arr.each_cons(2).map { |a, b| (b.to_i - a.to_i) }

    if !(arr.detect{ |e| arr.count(e) > 1 }) &&
        diffs_abs.max <= 3 && diffs_abs.min >= 1 &&
        (diffs.all? { |e| e.negative? } || diffs.all? { |e| e.positive? })
      safe += 1
    end
  end
end

p safe

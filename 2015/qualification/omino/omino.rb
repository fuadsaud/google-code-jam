def solve(x, r, c)
  area = r * c

  case x
  when 1
    "GABRIEL"
  when 2
    if area.even?
      "GABRIEL"
    else
      "RICHARD"
    end
  when 3
    if area != 3 && area % x == 0
      "GABRIEL"
    else
      "RICHARD"
    end
  when 4
    if area == 12 || area == 16
      "GABRIEL"
    else
      "RICHARD"
    end
  end
end

T = STDIN.gets.to_i

T.times.collect { |i|
  x, r, c = STDIN.gets.split(' ').map(&:to_i)

  puts "Case ##{ i + 1 }: #{ solve(x, r, c) }"

}

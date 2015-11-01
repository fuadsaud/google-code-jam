def solve(r, c, w)
  if r == 1
    if c == w
      c
    else
      c
    end
  end
end

T = STDIN.gets.i

T.times do |i|
  r, c, w = STDIN.gets.split.map(&:to_i)

  puts "Case #{ i + 1 }: #{ solve(r, c, w) }"
end

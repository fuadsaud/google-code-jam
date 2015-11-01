def solve(r, c, n)
end

T = STDIN.gets.to_i

T.times.collect { |i|
  r, c, n = STDIN.gets.split.map(&:to_i)

  puts "Case ##{ i + 1 }: #{ solve(r, c, n) }"
}

def solve(k, c, s)

end


T = STDIN.gets.to_i

T.times.collect { |i|
  k, c, s = STDIN.gets.chomp.split(' ').map(&:to_i)

  puts "Case ##{ i + 1 }: #{solve(k, c, s)}"
}

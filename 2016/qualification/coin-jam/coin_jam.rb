def solve(n, j)

end


T = STDIN.gets.to_i

T.times.collect { |i|
  n, j = STDIN.gets.chomp.split(' ').map(&:to_i)

  puts "Case ##{ i + 1 }"

  solve(n, j).each do |coin|
    puts coin
  end
}

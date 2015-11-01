require 'set'
require 'matrix'

def enough_ones?(n, m)
  m.to_a.flatten.count { |x| x == 1 } == (n * n) / 2
end

def solve(n, m)
  nn = n / 2
  return false unless enough_ones?(n, m)

  a_vec = [0, 1] * nn
  b_vec = [1, 0] * nn

  return false unless m.row_vectors[0].all? { |r| r == a_vec || r == b_vec }
  return false unless m.column_vectors[0].all? { |r| r == a_vec || r == b_vec }

  return 0
end

T = STDIN.gets.to_i

T.times.collect { |i|
  n = STDIN.gets.chomp.to_i * 2
  m = n.times.collect { STDIN.gets.chomp.chars.map(&:to_i) }

  result = solve(n, Matrix[m])

  puts "Case ##{ i + 1 }: #{ result ? result : "IMPOSSIBLE" }"
}

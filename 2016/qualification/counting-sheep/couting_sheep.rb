require 'set'

DIGITS = Set.new(0..9)

def solve(n, i: 1, digits: Set.new)
  return 'INSOMNIA' if n.zero?

  n_digits = (n * i).to_s.chars.map(&:to_i)

  new_digits = digits + n_digits

  if new_digits == DIGITS
    n * i
  else
    solve(n, i: i + 1, digits: new_digits)
  end

end


T = STDIN.gets.to_i

T.times.collect { |i|
  n = STDIN.gets.chomp.to_i

  puts "Case ##{ i + 1 }: #{solve(n)}"
}

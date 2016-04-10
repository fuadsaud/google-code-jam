require 'set'

DIGITS = Set.new(0..9)

def digits(i)
  i.to_s.chars.map(&:to_i)
end

def solve(n, i: 1, seen_digits: Set.new)
  return 'INSOMNIA' if n.zero?

  new_digits = seen_digits + digits(n * i)

  if new_digits == DIGITS
    n * i
  else
    solve(n, i: i + 1, seen_digits: new_digits)
  end
end

T = STDIN.gets.to_i

T.times do |i|
  n = STDIN.gets.chomp.to_i

  puts "Case ##{ i + 1 }: #{solve(n)}"
end

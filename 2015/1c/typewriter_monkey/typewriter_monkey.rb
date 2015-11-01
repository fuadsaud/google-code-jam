require 'rational'

def solve(keyboard, target, s)
  keys = Hash[keyboard.map { |k| [k, true] }]

  if target.uniq.all? { |c| keys.has_key?(c) } && target.size <= s
    probs = Hash[
      keyboard.group_by { |c| c }
              .map { |c, cs| [c, Rational(cs.size, keyboard.size)] }]

    target.map { |c| probs[c] }.reduce(&:*)
  else
    0
  end
end

# T = STDIN.gets.i

# T.times do |i|
#   k, l, s = STDIN.gets.split('').map(&:to_i)

#   keyboard, target = 2.times.collect { STDIN.gets.chars }

#   puts "Case #{ i + 1 }: #{ solve(keyboard, target, s) }"
# end

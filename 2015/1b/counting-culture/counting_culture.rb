def solve(n)
  i = 1
  c = 1

  case
  when n <= 20
    n
  when n < 100
    a = n / 10
    b = n % 10

    10 + a + b
  when n == 100
    29
  when n == 101
    30
  else
    c = 30
    i = 101

    while i < n
      is = i.to_s
      revs = is.reverse
      rev  = revs.to_i

      nex = i + 1
      nexs = nex.to_s
      revnex = nexs.reverse.to_i

      if rev > i && rev <= n && (revnex > n || (is[0] == '1' && is[-1] == '9'))
        i = rev
      else
        i += 1
      end

      c += 1
    end

    c
  end
end

T = STDIN.gets.to_i

T.times.collect { |i|
  n = STDIN.gets.to_i

  puts "Case ##{ i + 1 }: #{ solve(n) }"
}

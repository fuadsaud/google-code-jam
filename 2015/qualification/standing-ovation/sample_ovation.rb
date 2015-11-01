def solve(smax, shyness)
  shyness.each_with_index.reduce([0, 0]) { |(total, friends), (count, level)|
    break if level > smax

    new_friends = if total < level
                    friends + level - total
                  else
                    friends
                  end

    new_total = total + count + (new_friends - friends)

    # p level: level, count: count, total: total, friends: friends, new_total: new_total, new_friends: new_friends

    [new_total, new_friends]
  }.last
end

T = STDIN.gets.to_i

T.times.collect { |i|
  line = STDIN.gets.split(' ')

  puts "Case ##{ i + 1 }: #{ solve(line.first.to_i, line.last.split('').map(&:to_i)) }"
}

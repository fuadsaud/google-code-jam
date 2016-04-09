def solve(stack)
  chunks = stack.chunk { |pck| pck == '+' }

  blank_chunks = chunks.count { |state, _| !state }

  flips = blank_chunks * 2

  off =
    if chunks.first.first
      0
    else
      1
    end

  flips - off
end


T = STDIN.gets.to_i

T.times.collect { |i|
  stack = STDIN.gets.chomp.split('')

  puts "Case ##{ i + 1 }: #{solve(stack)}"
}

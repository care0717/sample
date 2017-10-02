N = gets.to_i
res = 0
N.times{
  l,r = gets.split(" ").map(&:to_i)
  res += r-l+1
}
puts(res)

# Develop a method that takes an array and returns sum, average, and mode.

def stats(array)
  result = {}
  result[:sum] = array.sum
  result[:avarage] = array.inject { |sum, element|
    sum + element
  }.to_f / array.size # inject аккумулирует в первом аргументе данные
  counts = Hash.new(0)
  array.each { |element| puts counts[element] += 1 }
  result[:mode] = counts.max_by { |_k, v| v }[0]
  result
end

array = [23, 34, 3, 2, 65, 30, 15, 24, -154, -25, 3, 3, 2]
puts stats(array)

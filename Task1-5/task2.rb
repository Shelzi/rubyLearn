# frozen_string_literal: true

def rectangle(a, b)
  a * b
end

def calculate_triangle_square(a, b, c)
  p = (a + b + c) / 2 # Half the perimeter
  Math.sqrt(p * (p - a) * (p - b) * (p - c))
end

puts rectangle(4, 5)
puts rectangle(4, 4) # square, but we can do separate method
puts calculate_triangle_square(4, 5, 6)

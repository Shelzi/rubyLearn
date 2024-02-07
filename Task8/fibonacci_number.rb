# frozen_string_literal: true

# Task 8 - 1 at the input of method task_4_1(n) (read "variable") is sent number n.
# Method task_4_1(n) should return a sequence of Fibonacci for the sent number n.
# • n is an argument indicating the number of elements in the sequence
# • Starting with 1. Return 0 if 0 is sent.
# • The maximum number is 1000
# • https://en.wikipedia.org/wiki/Fibonacci_number

def fibonacci_solver(n)
  return -1 if n.negative?
  return 0 if n.zero?
  return 1 if n == 1

  result = [0, 1]
  (1...n - 1).each do |i|
    result << result[i] + result[i - 1]
  end
  result
end

# puts fibonacci_solver(0)
# puts fibonacci_solver(1)
puts fibonacci_solver(5)
# puts fibonacci_solver(1000)
# puts fibonacci_solver(-10)

# frozen_string_literal: true
# пока не знаю что это, он сам их хочет создавать. Похоже на уточнее для других, что тут используются константы

require_relative 'utils/file_utils'

TASK_FILE_NAME = '/home/shelzi/rubyLearn/Task7/task_data.txt' # .freeze - создание константы, внутренне состояние которой нельзя изменить. Он сам мне это посоветовал и сам ругается что она не нужна

puts 'Console input - 1, prefilled input - 2'
user_input = gets.to_i
case user_input
when 1
  input = gets.to_s
  FileUtils.write_file(TASK_FILE_NAME, input)
when 2
  FileUtils.write_file(TASK_FILE_NAME)
end

file_data = FileUtils.read_file_by_lines(TASK_FILE_NAME).map(&:chomp)
words_count_hash = Hash.new(0)
file_data.each do |sentence|
  sentence.split(/[\s,."()]+/).each { |word| words_count_hash[word.to_sym] += 1 }
end
sorted_output = words_count_hash.sort_by { |_key, value| -value }.to_h
FileUtils.write_file('Task7/output.txt', sorted_output.to_s)

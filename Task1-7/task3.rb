# frozen_string_literal: true

def number_guesing_game
  loops_count = 0
  magic_number = rand(0..100)
  loop do
    puts 'Your number is (from 0 to 100 including): '
    gussing_number = gets.chomp.to_i
    if gussing_number == magic_number
      puts "You won! Number of turns: #{loops_count}"
      break

    end
    puts gussing_number < magic_number ? 'Higher!' : 'Lower'
    loops_count += 1
  end
end

number_guesing_game

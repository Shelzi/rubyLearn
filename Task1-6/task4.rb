# frozen_string_literal: true

# Task: Create a script that sorts an array of names alphabetically.

names = %w[Jonk Mike Gotas Risc Alf Nuochenbolshoeima]
names.sort! { |a, b| a <=> b }
puts names
S

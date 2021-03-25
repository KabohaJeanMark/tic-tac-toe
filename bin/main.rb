#!/usr/bin/env ruby

CHARACTER_1 = 'X'.freeze
CHARACTER_2 = 'O'.freeze

def user_input
  gets.chomp
end

puts 'Welcome to Ruby Tic Tac Toe'
puts
puts 'Enter Player 1 Name'
player1_name = user_input

puts

puts 'Enter Player 2 Name'
player2_name = user_input

puts
puts "#{player1_name} will play #{CHARACTER_1}"
puts "#{player2_name} will play #{CHARACTER_2}"

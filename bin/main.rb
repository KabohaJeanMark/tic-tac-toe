#!/usr/bin/env ruby

CHARACTER_1 = 'X'.freeze
CHARACTER_2 = 'O'.freeze

def user_input
  gets.chomp
end

def clear_terminal
  system('clear') || system('cls') # https://stackoverflow.com/a/19059008
end

def display_board
  puts '+---+---+---+'
  puts '| 1 | 2 | 3 |'
  puts '+---+---+---+'
  puts '| 4 | 5 | 6 |'
  puts '+---+---+---+'
  puts '| 7 | 8 | 9 |'
  puts '+---+---+---+'
end

def choose_winner(player1_name,player2_name)
  num = rand(15)
  if num < 5
    puts "#{player1_name} wins"
  elsif num < 10
    puts 'It is a tie'
  else
    puts "#{player2_name} wins"
  end
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

puts 'Let us play!'

sleep(3)

clear_terminal

sleep(1)

display_board

9.times do |turn|
  name = turn.even? ? player2_name : player1_name
  puts "It's #{name}'s turn"
  puts
  puts 'Please select an available cell from the board'
  puts
  cell = user_input.to_i
  while cell < 1 || cell > 9
    puts 'Invalid move. Please enter integer from 1 to 9'
    cell = user_input.to_i
  end
end

sleep(1)

choose_winner(player1_name,player2_name)

sleep(2)

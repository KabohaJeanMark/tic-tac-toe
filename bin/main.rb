#!/usr/bin/env ruby

CHARACTER_1 = 'X'.freeze
CHARACTER_2 = 'O'.freeze

def user_input
  gets.chomp
end

def clear_terminal
  system('clear') || system('cls') # https://stackoverflow.com/a/19059008
end

# https://stackoverflow.com/a/31090956
# see comment by cremno
def clear_lines(count)
  count.times { print "\e[A\e[2K" }
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

def choose_winner(player1_name, player2_name)
  num = rand(10)
  if num < 5
    puts "#{player1_name} you WIN the game"
  elsif num < 10
    puts "It's a TIE!"
    puts
    puts 'Game Over'
  else
    puts "#{player2_name} you WIN the game"
  end
end

puts 'Welcome to Ruby Tic-Tac-Toe!'
puts
puts 'Enter Player 1 Name:'
player1_name = user_input.capitalize

puts

puts 'Enter Player 2 Name:'
player2_name = user_input.capitalize

puts
puts "#{player1_name} will play #{CHARACTER_1} and #{player2_name} will play #{CHARACTER_2}"
puts
puts 'Let us play!'

sleep(3)

clear_terminal

sleep(1)

display_board

9.times do |turn|
  lines = 6

  name = turn.even? ? player1_name : player2_name
  puts
  puts "It's #{name}'s turn"
  puts
  puts 'Please select an available cell from the board `- -`'
  puts
  cell = user_input.to_i
  while cell < 1 || cell > 9
    puts 'Invalid move. Please enter a number from 1-9'
    cell = user_input.to_i
    lines += 2
  end
  sleep 1
  clear_lines(lines)
end

sleep(1)

puts

choose_winner(player1_name, player2_name)

sleep(2)

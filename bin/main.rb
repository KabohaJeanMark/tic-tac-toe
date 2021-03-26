#!/usr/bin/env ruby

require_relative './board.rb'
require_relative './player.rb'

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

def choose_winner(player1, player2)
  num = rand(10)
  if num < 5
    puts "#{player1} you WIN the game"
  elsif num < 10
    puts "It's a TIE!"
    puts
    puts 'Game Over'
  else
    puts "#{player2} you WIN the game"
  end
end

def validate_name(name)
  loop do
    if name == ''
      puts 'Please enter your name. Do not leave it empty. We need to know who wins :)'
      name = user_input.capitalize
    elsif name.length < 2
      puts 'Please enter a longer name. 1 digit is too short. Atleast 2 initials.'
      name = user_input.capitalize
    else
      break
    end
  end
  name
end

puts 'Welcome to Ruby Tic-Tac-Toe!'
puts
puts 'Enter Player 1 Name:'
p1_name = user_input
p1_name = validate_name(p1_name)
player1 = Player.new(p1_name, CHARACTER_1)
puts

puts 'Enter Player 2 Name:'
p2_name = user_input
p2_name = validate_name(p2_name)
player2 = Player.new(p2_name, CHARACTER_2)
puts

puts "#{player1} will play #{CHARACTER_1} and #{player2} will play #{CHARACTER_2}"
puts
puts 'Let us play!'

sleep(3)

clear_terminal

sleep(1)

display_board

9.times do |turn|
  lines = 6

  player = turn.even? ? player1 : player2
  puts
  puts "It's #{player}'s turn"
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

choose_winner(player1, player2)

sleep(2)

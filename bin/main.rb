#!/usr/bin/env ruby

require_relative './board'
require_relative './player'

CHARACTER_1 = 'X'.freeze
CHARACTER_2 = 'O'.freeze
MIN_MOVES = 5

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

def choose_winner(player1, player2)
  num = rand(15)
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

def check_three_cells_match(array, board, token)
  result = true
  array.each do |cell|
    if board.track(cell) != token
      result = false
      break
    end
  end
  result
end

def check_winner(board, player1, player2)
  players = [player1, player2]
  groups = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]
  groups.each do |group|
    players.each { |player| return player if check_three_cells_match(group, board, player.token) }
    #return player1 if check_three_cells_match(row, board, player1.token)
    #return player2 if check_three_cells_match(row, board, player2.token)
  end
  nil
end

board = Board.new

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

puts board

winner = nil

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
  board.set(cell, player.token)

  if turn >= MIN_MOVES
    winner = check_winner(board, player1, player2)
    break if winner
  end

  sleep 1
  clear_terminal
  puts board
end

sleep(1)

clear_terminal
puts board
puts

#choose_winner(player1, player2)
if winner
  puts "#{winner} you WIN the game"
else num < 10
  puts "It's a TIE!"
  puts
  puts 'Game Over'
end

command = user_input

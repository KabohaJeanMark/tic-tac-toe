#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'

def user_input
  gets.chomp
end

def clear_terminal
  system('clear') || system('cls')
end

def clear_lines(count)
  count.times { print "\e[A\e[2K" }
end

def choose_winner(player1, player2)
  num = rand(15)
  if num < 5
    puts "#{player1.name} you WIN the game"
  elsif num < 10
    puts "It's a TIE!"
    puts
    puts 'Game Over'
  else
    puts "#{player2.name} you WIN the game"
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
  end
  nil
end

def valid_move?(board, cell, token_array)
  loop do
    num = cell.to_i
    if num < 1 || num > 9
      clear_lines(3)
      puts "Invalid move. Please enter a number from 1-9. #{cell} is not a valid number"
      puts
      cell = user_input
    elsif token_array.include?(board.track(num))
      clear_lines(3)
      puts "Invalid move. Position #{cell} already played. Please select another number"
      puts
      cell = user_input
    else
      break
    end
  end
  cell.to_i
end

def take_turns(board, player1, player2, token_array)
  winner = nil

  9.times do |turn|
    player = turn.even? ? player1 : player2
    puts
    puts "It's #{player.name}'s turn"
    puts
    puts 'Please select an available cell from the board `- -`'
    puts
    cell = user_input
    cell = valid_move?(board, cell, token_array)
    board.set(cell, player.token)

    if turn >= 4
      winner = check_winner(board, player1, player2)
      break if winner
    end

    sleep(0.5)
    clear_terminal
    puts board
  end

  winner
end

def replay?
  puts 'Please Enter y for a new game or x for exit'
  puts

  loop do
    command = user_input.downcase
    case command
    when 'x'
      clear_terminal
      exit
    when 'y'
      clear_terminal
      play_game
    else
      clear_lines(3)
      puts 'Sorry, Invalid Input. Please Enter y for a new game or x for exit'
      puts
    end
  end
end

def get_player(prompt, character)
  puts prompt
  name = user_input
  name = validate_name(name)
  player = Player.new(name, character)
  puts
  player
end

def play_game
  token_array = %w[X O]

  board = Board.new

  puts "Welcome to Ruby Tic-Tac-Toe!\n\n"

  player1 = get_player('Enter Player 1 Name:', token_array[0])

  player2 = get_player('Enter Player 2 Name:', token_array[1])

  puts "#{player1.name} will play #{token_array[0]} and #{player2.name} will play #{token_array[1]}\n\nLet us play!"

  sleep(1)

  clear_terminal

  puts board

  winner = take_turns(board, player1, player2, token_array)

  sleep(0.5)

  clear_terminal
  puts "#{board}\n\n"

  if winner
    puts "#{winner.name} you WIN the game\n\n"
  else
    puts "It's a TIE!\n\nGame Over\n\n"
  end

  replay?
end

play_game

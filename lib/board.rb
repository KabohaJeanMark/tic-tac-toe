class Board
  def initialize
    @cells = {}
    reset
  end

  def reset
    (1..9).each { |num| @cells[num] = num }
  end

  def set(cell, token)
    @cells[cell] = token
  end

  def track(cell)
    @cells[cell]
  end

  def to_s
    demacator = "+---+---+---+\n"
    pos = 1
    text = demacator
    3.times do
      (pos..pos + 2).each do |num|
        text += "| #{@cells[num]} "
      end
      text += "|\n#{demacator}"
      pos += 3
    end
    text
  end
end

class Cell
  include Comparable
  attr_reader :x, :y, :previous

  def initialize(x_coord, y_coord, previous = nil)
    @x = x_coord
    @y = y_coord
    @previous = previous
  end

  def adjacent_cells
    cells = []
    cells += get_four_cells(1)
    cells += get_four_cells(-1)
    cells
  end

  def get_four_cells(x_multiplier)
    cells = []
    y_multiplier = 1
    4.times do |i|
      x_increment = (i + 1).odd? ? 1 : 2
      y_increment = x_increment == 1 ? 2 : 1
      y_multiplier = -1 if i == 2

      cells.push(Cell.new(x + x_increment * x_multiplier, y + y_increment * y_multiplier, self))
    end
    cells
  end

  def equal?(other)
    x == other.x && y == other.y
  end
end

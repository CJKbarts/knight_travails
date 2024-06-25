require_relative 'lib/cell'
require_relative 'lib/knight'

test = Knight.new
start = Cell.new(0, 0)
target = Cell.new(7, 7)
test.knight_moves(start, target)

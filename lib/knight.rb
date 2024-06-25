class Knight
  def knight_moves(start, target)
    target = get_queue(start, target)[-1]
    path = shortest_path(target).map { |cell| [cell.x, cell.y] }
    puts "You made it in #{path.length - 1} moves!"
    path.each { |cell| p cell }
  end

  def get_queue(start, target)
    queue = [start]
    target_index = 0
    queue.each do |cell|
      break if cell.equal?(target)

      cell.adjacent_cells.each { |new_cell| queue.push(new_cell) }
      target_index += 1
    end

    queue[0..target_index]
  end

  def shortest_path(target)
    path = [target]
    current_cell = target
    until current_cell.previous.nil?
      path.prepend(current_cell.previous)
      current_cell = current_cell.previous
    end
    path
  end
end

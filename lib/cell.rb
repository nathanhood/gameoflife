class Cell

  attr_accessor :x, :y, :alive

  def initialize(x, y, alive=false)
    @x = x
    @y = y
    @alive = alive
  end

  def neighbor?(new_cell)
    result = Math.sqrt((new_cell.y - self.y)**2 + (new_cell.x - self.x)**2).floor
    return result == 1
  end

  def find_alive_neighbors(cells)
    alive_neighbors = 0
    cells.each do |new_cell|
      if self.neighbor?(new_cell) && new_cell.alive
        alive_neighbors +=1
      end
    end
    return alive_neighbors
  end

end

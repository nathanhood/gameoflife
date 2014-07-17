class World

  attr_accessor :time
  attr_accessor :cells

  def initialize(size=0)
    @time = 0
    @cells = []
    size.times do |x|
      size.times do |y|
        obj = Cell.new(x,y)
        @cells << obj
      end
    end
  end

  def tick(array=[])
    @time += 1
    array.each do |cell|
      if cell.alive
        cell.alive = false
      else
        cell.alive = true
      end
    end
  end


  def find_neighbors
    toggle = []
    self.cells.each do |cell|
      if cell.alive
        alive_neighbors = cell.find_alive_neighbors(self.cells)
        if alive_neighbors < 2 || alive_neighbors > 3
          toggle << cell
        end
      else
        alive_neighbors = cell.find_alive_neighbors(self.cells)
        if alive_neighbors ==3
          toggle << cell
        end
      end
    end
    tick(toggle)
  end

  def toggle_cells(*cells)
    cells.each do |i|
      cell = self.cells[i]
      if cell.alive == false
        cell.alive = true
      else
        cell.alive = false
      end
    end
  end

end

require 'test_helper'

class CellTest < MiniTest::Unit::TestCase

  # def setup
    # This is ran before all the tests. Useful
    # when preparing input data for the objects/methods you
    # wish to test.
  # end

  def test_cell_creation
    @cell = Cell.new(0,1)
    assert_respond_to(@cell, :x)
    assert_respond_to(@cell, :y)
    assert_equal(0, @cell.x)
    assert_equal(1, @cell.y)
  end

  def test_are_neighbors
    @cell = Cell.new(0,0)
    @cell2 = Cell.new(1,1)
    assert_equal(true, @cell.neighbor?(@cell2))
  end


end

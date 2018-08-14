require "../spec_helper"

describe Grid do
  describe "#has_obstacle" do
    it "should not detect an obstacle if there isn't for a given point" do
      Grid.new(3, 3, [] of Point).has_obstacle?(Point.new(1, 1)).should be_false
    end

    it "should detect an obstacle if there is one for a given point" do
      Grid.new(3, 3, [Point.new(1, 1)]).has_obstacle?(Point.new(1, 1)).should be_true
    end
  end

  describe "#fit_in" do
    grid = Grid.new(3, 3, [] of Point)

    it "should return the same point given a point inside the grid" do
      grid.fit_in(Point.new(1, 1)).should eq(Point.new(1, 1))
    end

    it "should return the same point given a point in the edge of the grid" do
      grid.fit_in(Point.new(2, 1)).should eq(Point.new(2, 1))
    end

    it "should return an analogous point inside the grid given a point outside" do
      grid.fit_in(Point.new(4, 1)).should eq(Point.new(1, 1))
    end
  end
end

require "../spec_helper"

include Location

describe Location do
  describe Direction do
    it "should give the right side of the direction" do
      Direction.right(Direction::North).should eq(Direction::East)
      Direction.right(Direction::East).should eq(Direction::South)
      Direction.right(Direction::South).should eq(Direction::West)
      Direction.right(Direction::West).should eq(Direction::North)
    end

    it "should give the left side of the direction" do
      Direction.left(Direction::North).should eq(Direction::West)
      Direction.left(Direction::West).should eq(Direction::South)
      Direction.left(Direction::South).should eq(Direction::East)
      Direction.left(Direction::East).should eq(Direction::North)
    end

    it "should give the opposite side of the direction" do
      Direction.opposite(Direction::North).should eq(Direction::South)
      Direction.opposite(Direction::West).should eq(Direction::East)
      Direction.opposite(Direction::South).should eq(Direction::North)
      Direction.opposite(Direction::East).should eq(Direction::West)
    end
  end

  describe Grid do
    describe "#has_obstacle" do
      it "should not detect an obstacle if there isn't for a given point" do
        Grid.new(3,3,[] of Point).has_obstacle(Point.new(1,1)).should be_false
      end

      it "should detect an obstacle if there is one for a given point" do
        Grid.new(3,3,[Point.new(1,1)]).has_obstacle(Point.new(1,1)).should be_true
      end
    end
  end
end

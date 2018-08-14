require "../spec_helper"

include Location

describe Location do
  describe Point do
    describe "#step_to" do
      point = Point.new(2, 2)

      it "should step to north" do
        Point.step_to(point, Direction::North).should eq(Point.new(2, 3))
      end

      it "should step to south" do
        Point.step_to(point, Direction::South).should eq(Point.new(2, 1))
      end

      it "should step to east" do
        Point.step_to(point, Direction::East).should eq(Point.new(3, 2))
      end

      it "should step to west" do
        Point.step_to(point, Direction::West).should eq(Point.new(1, 2))
      end
    end
  end

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
end

require "../spec_helper"

include Location
include Movement

describe Movement do
  describe "#step_to" do
    point = Point.new(2, 2)

    it "should step to north" do
      step_to(point, Direction::North).should eq(Point.new(2, 3))
    end

    it "should step to south" do
      step_to(point, Direction::South).should eq(Point.new(2, 1))
    end

    it "should step to east" do
      step_to(point, Direction::East).should eq(Point.new(3, 2))
    end

    it "should step to west" do
      step_to(point, Direction::West).should eq(Point.new(1, 2))
    end
  end

  describe "#analogous_of" do
    it "should return the same point given a point inside the grid" do
      analogous_of(Point.new(1, 1), Grid.new(3, 3)).should eq(Point.new(1, 1))
    end

    it "should return the same point given a point in the edge of the grid" do
      analogous_of(Point.new(2, 1), Grid.new(3, 3)).should eq(Point.new(2, 1))
    end

    it "should return an analogous point inside the grid given a point outside" do
      analogous_of(Point.new(4, 1), Grid.new(3, 3)).should eq(Point.new(1, 1))
    end
  end

  describe "#next" do
    grid = Grid.new(4, 4)
    current_position = Position.new(Point.new(2, 2), Direction::North)

    it "should calculate the next position for a move forward command" do
      position = next_position(grid, current_position, Command::MoveForward)
      position.should eq(Position.new(Point.new(2, 3), Direction::North))
    end

    it "should calculate the next position for a move backward command" do
      position = next_position(grid, current_position, Command::MoveBackward)
      position.should eq(Position.new(Point.new(2, 1), Direction::North))
    end

    it "should calculate the next position for a turn right command" do
      position = next_position(grid, current_position, Command::TurnRight)
      position.should eq(Position.new(Point.new(2, 2), Direction::East))
    end

    it "should calculate the next position for a turn left command" do
      position = next_position(grid, current_position, Command::TurnLeft)
      position.should eq(Position.new(Point.new(2, 2), Direction::West))
    end

    it "should wrap from one edge of the grid to another" do
      position = next_position(grid, Position.new(Point.new(3, 3), Direction::North), Command::MoveForward)
      position.should eq(Position.new(Point.new(3, 0), Direction::North))
    end
  end
end

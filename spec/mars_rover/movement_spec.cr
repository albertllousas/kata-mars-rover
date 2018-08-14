require "../spec_helper"

include Location
include Movement

describe Movement do
  describe "#next" do
    current_position = Position.new(Point.new(2, 2), Direction::North)

    it "should calculate the next position for a move forward command" do
      position = next_position(current_position, Command::MoveForward)
      position.should eq(Position.new(Point.new(2, 3), Direction::North))
    end

    it "should calculate the next position for a move backward command" do
      position = next_position(current_position, Command::MoveBackward)
      position.should eq(Position.new(Point.new(2, 1), Direction::North))
    end

    it "should calculate the next position for a turn right command" do
      position = next_position(current_position, Command::TurnRight)
      position.should eq(Position.new(Point.new(2, 2), Direction::East))
    end

    it "should calculate the next position for a turn left command" do
      position = next_position(current_position, Command::TurnLeft)
      position.should eq(Position.new(Point.new(2, 2), Direction::West))
    end
  end
end

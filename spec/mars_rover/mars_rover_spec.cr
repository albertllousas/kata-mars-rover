require "../spec_helper"

include Location
include MarsRover
include Commands

describe MarsRover::Rover do

  it "works" do
    rover = Rover.new(Position.new(Point.new(0,0), Direction::North))
    new_rover = rover.move(Command::MoveForward)
    rover.position.should eq(2)
  end
end

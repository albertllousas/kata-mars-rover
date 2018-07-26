require "../spec_helper"

include Location
include Commands

describe Rover do
  #  it "works" do
  #    rover = Rover.new(
  #      Position.new(Point.new(0, 0), Direction::North),
  #      Grid.new(0, 0),
  #      ->(point : Point) {}
  #    )
  #    new_rover = rover.move(Command::MoveForward)
  #    rover.position.should eq(2)
  #  end
end

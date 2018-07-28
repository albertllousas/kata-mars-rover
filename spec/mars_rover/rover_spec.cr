require "../spec_helper"

include Location

describe Rover do
  start_position = Position.new(Point.new(0, 0), Direction::North)
  grid = Grid.new(5, 5, [Point.new(0, 3)])
  report_function = ->(p : Point) {}

  it "should initialize a rover given an start position" do
    rover = Rover.new(start_position, grid, report_function)
    rover.position.should eq(Position.new(Point.new(0, 0), Direction::North))
  end

  it "should return a new rover with the final position when all commands are executed successfully" do
    rover = Rover.new(start_position, grid, report_function)
    rover = rover.execute("ffrff")
    rover.position.should eq(Position.new(Point.new(2, 2), Direction::East))
  end

  it "should moves up to the last possible point and reports the obstacle when and obstacle is encoutered" do
    obstacle_encoutered = false
    # we have to specify nil to make the proc return nil
    # there is an open error: https://github.com/crystal-lang/crystal/issues/3655
    # also https://github.com/waterlink/mocks.cr is not working with crystal `0.25.1`, so not possible mocking
    report = ->(p : Point) { obstacle_encoutered = true;nil}

    rover = Rover.new(start_position, grid, report)
    rover = rover.execute("ffffrffb")

    rover.position.should eq(Position.new(Point.new(0, 2), Direction::North))
    obstacle_encoutered.should be_truthy
  end
  it "should wrap from one edge of the grid to another (planets are spheres after all)" do
    rover = Rover.new(start_position, grid, report_function)
    rover = rover.execute("b")
    rover.position.should eq(Position.new(Point.new(0, 4), Direction::North))
  end
end

module Movement
  extend self

  def next_position(grid : Grid, position : Position, command : Command) : Position
    case command
    when Command::MoveForward
      next_point = step_to(position.point, position.direction)
      position.with fit_in(next_point, grid)
    when Command::MoveBackward
      next_point = step_to(position.point, Direction.opposite(position.direction))
      position.with fit_in(next_point, grid)
    when Command::TurnRight
      position.with Direction.right(position.direction)
    when Command::TurnLeft
      position.with Direction.left(position.direction)
    else
      position
    end
  end

  def fit_in(point : Point, grid : Grid) : Point
      Point.new(point.x.modulo(grid.sizeX), point.y.modulo(grid.sizeY))
  end

  def step_to(point : Point, direction : Direction) : Point
    case direction
    when .north?
      Point.new(point.x, point.y + 1)
    when .south?
      Point.new(point.x, point.y - 1)
    when .east?
      Point.new(point.x + 1, point.y)
    when .west?
      Point.new(point.x - 1, point.y)
    else
      point
    end
  end
end

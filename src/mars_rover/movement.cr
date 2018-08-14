module Movement
  extend self

# to Position self

  def next_position(position : Position, command : Command) : Position
    case command
    when Command::MoveForward
      position.with step_to(position.point, position.direction)
    when Command::MoveBackward
      position.with step_to(position.point, Direction.opposite(position.direction))
    when Command::TurnRight
      position.with Direction.right(position.direction)
    when Command::TurnLeft
      position.with Direction.left(position.direction)
    else
      position
    end
  end



  # to Point self


  ONE_STEP = 1

  def step_to(point : Point, direction : Direction) : Point
    case direction
    when .north?
      Point.new(point.x, point.y + ONE_STEP)
    when .south?
      Point.new(point.x, point.y - ONE_STEP)
    when .east?
      Point.new(point.x + ONE_STEP, point.y)
    when .west?
      Point.new(point.x - ONE_STEP, point.y)
    else
      point
    end
  end
end

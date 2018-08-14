module Movement
  extend self

# to Position self

  def next_position(position : Position, command : Command) : Position
    case command
    when Command::MoveForward
      position.with Point.step_to(position.point, position.direction)
    when Command::MoveBackward
      position.with Point.step_to(position.point, Direction.opposite(position.direction))
    when Command::TurnRight
      position.with Direction.right(position.direction)
    when Command::TurnLeft
      position.with Direction.left(position.direction)
    else
      position
    end
  end

end

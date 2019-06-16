class Rover
  getter position

  def initialize(
    @position : Position,
    @grid : Grid,
    @report_obstacle : Point -> Void,
    # defaults
    @parse_command : Char -> Command = ->Commands.parse_command(Char),
    @next_position : (Position, Command) -> Position = ->Rover.next(Position, Command)
  )
  end

  def execute(commands : String) : Rover
    if commands.empty?
      self
    else
      command = @parse_command.call(commands.char_at 0)
      next_position = @next_position.call(@position, command)
      wrapped_position = next_position.copy_with point: @grid.fit_in(next_position.point)
      if @grid.has_obstacle? wrapped_position.point
        @report_obstacle.call wrapped_position.point
        self
      else
        self.with(wrapped_position).execute(commands[1..-1])
      end
    end
  end

  private def with(position : Position)
    rover = Rover.new(position, @grid, @report_obstacle, @parse_command, @next_position)
  end

  def self.next(position : Position, command : Command) : Position
      case command
        when Command::MoveForward
          position.copy_with point: Point.step_to(position.point, position.direction)
        when Command::MoveBackward
          position.copy_with point: Point.step_to(position.point, Direction.opposite(position.direction))
        when Command::TurnRight
          position.copy_with direction: Direction.right(position.direction)
        when Command::TurnLeft
          position.copy_with direction: Direction.left(position.direction)
        else
          position
        end
      end
  end
end

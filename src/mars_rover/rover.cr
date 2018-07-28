class Rover
  getter position

  def initialize(
    @position : Position,
    @grid : Grid,
    @report_obstacle : Point -> Void,
    # defaults
    @parse_command : Char -> Command = ->Commands.parse_command(Char),
    @next_position : (Grid, Position, Command) -> Position = ->Movement.next_position(Grid, Position, Command)
  )
  end

  def execute(commands : String) : Rover
    if commands.empty?
      self
    else
      command = @parse_command.call(commands.char_at 0)
      next_position = @next_position.call(@grid , @position, command)
      if @grid.has_obstacle? next_position.point
        @report_obstacle.call next_position.point
        self
      else
        self.with(next_position).execute(commands[1..-1])
      end
    end
  end

  private def with(position : Position)
    rover = Rover.new(position, @grid, @report_obstacle, @parse_command, @next_position)
  end

end

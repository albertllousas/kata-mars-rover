module Location
  extend self

  enum Direction
    North
    East
    South
    West

    def self.right(direction : Direction)
      Direction.new((direction.value + 1).modulo(4))
    end

    def self.left(direction : Direction)
      Direction.new((direction.value - 1).modulo(4))
    end

    def self.opposite(direction : Direction)
      Direction.new((direction.value + 2).modulo(4))
    end
  end

  record Point, x : Int32 = 0, y : Int32 = 0 do
    ONE_STEP = 1

    def self.step_to(point : Point, direction : Direction) : Point
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

  record Position, point : Point, direction : Direction do
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

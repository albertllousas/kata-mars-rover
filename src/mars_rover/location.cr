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
        point.copy_with y: point.y + ONE_STEP
      when .south?
        point.copy_with y: point.y - ONE_STEP
      when .east?
        point.copy_with x: point.x + ONE_STEP
      when .west?
        point.copy_with x: point.x - ONE_STEP
      else
        point
      end
    end
  end

  record Position, point : Point, direction : Direction

end

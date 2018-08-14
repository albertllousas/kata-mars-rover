module Location
  extend self

# to https://github.com/crystal-lang/crystal/blob/master/src/macros.cr

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

  struct Point
    getter x : Int32
    getter y : Int32

    def initialize(@x : Int, @y : Int)
    end
  end

  struct Position
    getter point : Point
    getter direction : Direction

    def initialize(@point : Point, @direction : Direction)
    end

    def with(point : Point)
      Position.new(point, @direction)
    end

    def with(direction : Direction)
      Position.new(@point, direction)
    end
  end


# to new file as class
  struct Grid
    getter sizeX : Int32
    getter sizeY : Int32

    def initialize(@sizeX : Int32, @sizeY : Int32, @obstacles : Array(Point) = [] of Point)
    end

    def fit_in(point : Point) : Point
      Point.new(point.x.modulo(@sizeX), point.y.modulo(@sizeY))
    end

    def has_obstacle?(point : Point) : Bool
      (@obstacles & [point]).size != 0
    end
  end
end

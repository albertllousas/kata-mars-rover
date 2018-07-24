module Location

  enum Direction
    North
    South
    East
    West
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
  end

end

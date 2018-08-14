class Grid
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

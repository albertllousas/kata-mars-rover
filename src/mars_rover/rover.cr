module MarsRover

  def moveRover(command : Command) : Int32
    1
  end

  class Rover

      getter position

      def initialize(
          @position : Position,
          @move : Command -> Int32 = ->moveRover(Command) # parser, is_valid, next_pos (pos, movement) -> next_pos
      )
      end

      def execute(commands : String): Rover
#        move
#         if final rover
#          else execute
      end

      def move(command : Command) : Int32
#      next_pos
        @move.call(command)
      end
  end

end

module Commands
  extend self

  enum Command
    MoveForward
    MoveBackward
    TurnLeft
    TurnRight
  end

  class UnparseableCommandException < Exception
  end

  def parse_command(command : Char) : Command
    case command
    when 'f'
      Command::MoveForward
    when 'b'
      Command::MoveBackward
    when 'r'
      Command::TurnRight
    when 'l'
      Command::TurnLeft
    else
      raise UnparseableCommandException.new("unknown command: '#{command}'")
    end
  end
end

require "../spec_helper"

include Commands


describe Commands do
  describe "#parse_command" do
    it "should succeed parsing forward command " do
      Commands.parse_command('f').should eq(Command::MoveForward)
    end

    it "should succeed parsing backward command" do
      Commands.parse_command('b').should eq(Command::MoveBackward)
    end

    it "should succeed parsing right command" do
      Commands.parse_command('r').should eq(Command::TurnRight)
    end

    it "should succeed parsing left command " do
      Commands.parse_command('l').should eq(Command::TurnLeft)
    end

    it "should fail parsing unknown command" do
      expect_raises(UnparseableCommandException, "unknown command: 'x'") do
        Commands.parse_command('x')
      end
    end
  end
end

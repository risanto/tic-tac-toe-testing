require '../lib/tic-tac-toe.rb'

describe "Tic tac toe" do
    it "returns 'Invalid move! Please pick another location' when index i/j inputted is not available" do
        tic = Board.new

        # I'm not sure that this is how I supposed to do it
        
        allow(tic).to receive(:gets).and_return("You can only input 0-2")
    end
end
require '../lib/tic-tac-toe.rb'

class Test
    def input_i
        i = gets.chomp.to_i

        if i >= 0 && i <= 2
            correct_input_i = true
        else
            puts ""
            puts "You can only input 0-2"
        end
    end
end

describe "Tic tac toe" do
    describe "#play" do
        it "displays 'You can only input 0-2' when user input of i/j is not available" do
            tic = Test.new

            allow(tic).to receive(:gets).and_return('3')

            expect do
                tic.input_i
            end.to output("\nYou can only input 0-2\n").to_stdout
        end
    end

    describe "#check_win?" do
        it "returns true when the board reads XXX/OOO horizontally accross any row" do
            tic = Board.new
            tic.board[0] = ['X', 'X', 'X']
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board[1] = ['X', 'X', 'X']
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board[2] = ['X', 'X', 'X']
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board[0] = ['O', 'O', 'O']
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board[1] = ['O', 'O', 'O']
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board[2] = ['O', 'O', 'O']
    
            expect(tic.check_win?).to eql(true)
        end

        it "returns true when the board reads XXX/OOO vertically accross any column" do
            tic = Board.new
            tic.board = [
                ['X', ' ', ' '],
                ['X', ' ', ' '],
                ['X', ' ', ' ']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                [' ', 'X', ' '],
                [' ', 'X', ' '],
                [' ', 'X', ' ']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                [' ', ' ', 'X'],
                [' ', ' ', 'X'],
                [' ', ' ', 'X']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                ['O', ' ', ' '],
                ['O', ' ', ' '],
                ['O', ' ', ' ']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                [' ', 'O', ' '],
                [' ', 'O', ' '],
                [' ', 'O', ' ']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                [' ', ' ', 'O'],
                [' ', ' ', 'O'],
                [' ', ' ', 'O']
            ]
    
            expect(tic.check_win?).to eql(true)
        end

        it "returns true when the board reads XXX/000 diagonally from top left/right" do
            tic = Board.new
            tic.board = [
                ['X', ' ', ' '],
                [' ', 'X', ' '],
                [' ', ' ', 'X']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                [' ', 'O', 'X'],
                [' ', 'X', ' '],
                ['X', 'O', ' ']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                ['O', ' ', ' '],
                [' ', 'O', ' '],
                [' ', ' ', 'O']
            ]
    
            expect(tic.check_win?).to eql(true)

            tic = Board.new
            tic.board = [
                [' ', ' ', 'O'],
                [' ', 'O', ' '],
                ['O', ' ', ' ']
            ]
    
            expect(tic.check_win?).to eql(true)
        end

        it "returns false when the board reads less than three Xs or Os either horizontally, vertically, or diagonally" do
            tic = Board.new
            tic.board = [
                [' ', ' ', ' '],
                [' ', 'O', ' '],
                ['O', ' ', ' ']
            ]
    
            expect(tic.check_win?).to eql(false)

            tic = Board.new
            tic.board = [
                [' ', ' ', 'X'],
                [' ', 'O', ' '],
                ['O', ' ', 'X']
            ]
    
            expect(tic.check_win?).to eql(false)

            tic = Board.new
            tic.board = [
                ['X', 'O', 'X'],
                [' ', 'O', ' '],
                ['O', ' ', 'X']
            ]
    
            expect(tic.check_win?).to eql(false)
        end
    end
end
def read_input
   all_input = File.read("input.txt").split("\n\n")
   
   all_input.map.with_index do |itr,idx|  
      idx == 0 ? 
      itr.split(",").map(&:to_i) : 
      itr.split("\n")
   end
end

random, *boards = read_input

class Bingo
   attr_reader :boards, :winners

   def initialize(boards)
      @boards = boards.map {|board| Board.new(board)}
      @winners = []
   end

   def play(val)
      boards.each do|brd| 
         if !brd.is_winner
            brd.mark_number(val)
            if brd.check_winner
               brd.is_winner = true
               winners << brd.calculate_score(val)
               # return 
            end
         end
      end
      nil
   end

   def test
      print @boards
   end
end

class Board 
   attr_reader :values, :state, :score
   attr_accessor :is_winner

   def initialize(board)
      @values = board.map {|row| row.split.map(&:to_i)}
      @state = [[0,0,0,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0],
         [0,0,0,0,0]]
      @score = 0
      @is_winner = false
   end
   
   def mark_number(val)
      values.each_with_index do |row, row_index|
         row.each_with_index do |col, col_index|
            if(col == val) 
               state[row_index][col_index] = 1
            end
         end
      end
   end

   def check_winner
      def check_rows
         5.times do |row|
            if state[row][0] == 1 && state[row][1] == 1 && state[row][2] == 1 && state[row][3] == 1 && state[row][4] == 1
               return true
            end
         end
         false
      end
      def check_cols
         5.times do |col|
            if state[0][col] == 1 && state[1][col] == 1 && state[2][col] == 1 && state[3][col] == 1 && state[4][col] == 1
               return true
            end
         end
         false
      end
      check_cols || check_rows
   end

   def calculate_score(curr)
      sum = 0
      5.times do |row|
         5.times do |col|
            if(state[row][col]==0)
               sum += values[row][col]
            end
         end
      end
      score = curr * sum
      score
   end
end

def part_one(random,boards)
   bingo = Bingo.new(boards)
   random.each do |num|
      score = bingo.play(num)
      # if score != nil
      #    return score
      # end
   end
   puts bingo.winners[0]
   puts bingo.winners[bingo.winners.length - 1]
end

print part_one(random,boards)
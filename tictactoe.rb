class TicTacToe
  @@grid = [1,2,3,4,5,6,7,8,9]
  @@WINNING_SEQUENCE = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  @@player1_seq = []
  @@player2_seq = []
  @@turn = 0
  @@win = false

  def play
    while !@@win 
      @round = @@turn%2
      if @@turn%2 == 0
        puts "Player 1, please select a placement: "
        box = gets.chomp.to_i
        player_move(box, @round)
        tie?
      elsif @@turn%2 == 1
        puts "Player 2, please select a placement: "
        box = gets.chomp.to_i
        player_move(box, @round)
        tie?
      end
    end
  end

  private

  def player_move(box, player)
    if box < 1 || box > 9
      puts "Out of range. Try another placement"
      return
    elsif @@grid[box-1] == "X" || @@grid[box-1] == "O"
      puts "The box has already been taken. Try another placement..."
      return
    end
    @@turn += 1
    @@turn%2 == 0? @@grid[box-1] = "O": @@grid[box-1] = "X"
    @@grid = @@grid[0..2] + @@grid[3..5] + @@grid[6..8]
    #p @@grid
    puts @@grid[0].to_s + "|" + @@grid[1].to_s + "|" + @@grid[2].to_s
    puts "-----"
    puts @@grid[3].to_s + "|" + @@grid[4].to_s + "|" + @@grid[5].to_s
    puts "-----"
    puts @@grid[6].to_s + "|" + @@grid[7].to_s + "|" + @@grid[8].to_s
    @player = @@turn%2 == 0? @@player1_seq.push(box).sort!: @@player2_seq.push(box).sort!
    @winner = @@turn%2 == 0? "2": "1"
    @@WINNING_SEQUENCE.each do |iter|
      if iter.all? {|pos| @player.include? (pos)}
        puts "Player #{@winner} has won!"
        @@win = true
        break
      end
    end
  end

  def tie?
    if @@turn > 8 && @@win == false
      puts "Its a tie."
      @@win = true
    end
  end
end

game = TicTacToe.new
game.play
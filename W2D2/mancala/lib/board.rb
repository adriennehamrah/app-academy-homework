class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new([])}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      cups[i] += [:stone, :stone, :stone, :stone] unless i == 6 || i ==13
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless [0..13].include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
    curr_cup_idx = start_pos + 1
    until stones.empty?
      curr_cup_idx = 0 if curr_cup_idx == 14
      if current_player_name == @name1
        @cups[curr_cup_idx] << stones.pop unless curr_cup_idx == 13
      elsif current_player_name == @name2
        @cups[curr_cup_idx] << stones.pop unless curr_cup_idx == 6
      end
      curr_cup_idx += 1
    end
    render
    next_turn(curr_cup_idx - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns

    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    elsif @cups[ending_cup_idx].count > 0
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[0..5].all?(&:empty?)
  end

  def winner
    if @cups[6].count == @cups[13].count
      :draw
    elsif @cups[6].count < @cups[13].count
      @name2
    else
      @name1
    end
  end
end

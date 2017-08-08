class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      next if i == 6 || i == 13
      @cups[i] += [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 12
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos

    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx == 14
      case cup_idx
      when 6
        @cups[cup_idx] << stones.pop if current_player_name == @name1
      when 13
        @cups[cup_idx] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end

    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].size == 1
      :switch
    elsif @cups[ending_cup_idx].size > 0
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
    @cups[0..5].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count

    case player1_score <=> player2_score
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end

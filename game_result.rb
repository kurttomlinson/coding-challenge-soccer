class GameResult
  attr_reader :left_team_points, :right_team_points

  def initialize(line)
    @line = line.strip
    verify_line!
    assign_points
  end

  def left_team
    @left_team ||= left_team_goals.split(" ")[0..-2].join(" ")
  end

  def right_team
    @right_team ||= right_team_goals.split(" ")[0..-2].join(" ")
  end

  private

  def verify_line!
    if @line !~ /\A[a-zA-Z ]+\d+, [a-zA-Z ]+\d+\z/
      raise "Invalid game result input format: '#{@line}'"
    end
  end

  def assign_points
    if left_goals > right_goals
      @left_team_points = 3
      @right_team_points = 0
    elsif left_goals < right_goals
      @left_team_points = 0
      @right_team_points = 3
    else
      @left_team_points = 1
      @right_team_points = 1
    end
  end

  def left_goals
    @left_goals ||= left_team_goals.split(" ").last.to_i
  end

  def left_team_goals
    @left_team_goals ||= @line.split(",").first.strip
  end

  def right_goals
    @right_goals ||= right_team_goals.split(" ").last.to_i
  end

  def right_team_goals
    @right_team_goals ||= @line.split(",").last.strip
  end
end

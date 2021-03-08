class LeagueStandings
  def initialize
    @game_results = []
  end

  def record_game_result(game_result)
    @game_results.push(game_result)
  end

  def games_recorded
    @game_results.length
  end

  def to_s
    sorted_team_points.first(3).map do |tuple|
      team_name = tuple[0]
      team_points = tuple[1]
      counter_word = team_points == 1 ? "pt" : "pts"
      "#{team_name}, #{team_points} #{counter_word}"
    end.join("\n")
  end

  private

  def sorted_team_points
    team_points.sort_by do |tuple|
      team_name = tuple[0]
      team_points = tuple[1]
      [-team_points, team_name]
    end
  end

  def team_points
    points_by_team.reduce([]) do |memo, tuple|
      team = tuple[0]
      points = tuple[1]
      memo.push([team, points])
    end
  end

  def points_by_team
    @game_results.reduce({}) do |memo, game_result|
      memo[game_result.left_team] ||= 0
      memo[game_result.left_team] += game_result.left_team_points
      memo[game_result.right_team] ||= 0
      memo[game_result.right_team] += game_result.right_team_points
      memo
    end
  end
end

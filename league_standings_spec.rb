require "./league_standings.rb"

describe LeagueStandings do
  it "knows how many games have been recorded" do
    league_standings = described_class.new
    expect(league_standings.games_recorded).to eq(0)

    league_standings.record_game_result(GameResult.new("A 1, B 2"))
    expect(league_standings.games_recorded).to eq(1)

    league_standings.record_game_result(GameResult.new("A 1, B 2"))
    expect(league_standings.games_recorded).to eq(2)

    league_standings.record_game_result(GameResult.new("A 1, B 2"))
    expect(league_standings.games_recorded).to eq(3)
  end

  it "sorts results by points" do
    league_standings = described_class.new

    league_standings.record_game_result(GameResult.new("A 1, B 2"))

    expect(league_standings.to_s).to eq("B, 3 pts\nA, 0 pts")
  end

  it "sorts results by points, then alphabetically" do
    league_standings = described_class.new

    league_standings.record_game_result(GameResult.new("C 1, D 2"))
    league_standings.record_game_result(GameResult.new("A 1, B 2"))

    expect(league_standings.to_s).to eq("B, 3 pts\nD, 3 pts\nA, 0 pts")
  end

  it "reports only the top three teams" do
    league_standings = described_class.new

    league_standings.record_game_result(GameResult.new("C 1, D 2"))
    league_standings.record_game_result(GameResult.new("A 1, B 2"))

    expect(league_standings.to_s.split("\n").length).to eq(3)
  end

  it "pluralizes 'pts' correctly" do
    league_standings = described_class.new

    league_standings.record_game_result(GameResult.new("A 2, B 2"))
    league_standings.record_game_result(GameResult.new("C 2, D 0"))

    expect(league_standings.to_s).to eq("C, 3 pts\nA, 1 pt\nB, 1 pt")
  end
end

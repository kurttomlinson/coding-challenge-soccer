require "./game_result.rb"

describe GameResult do
  it "processes a left win correctly" do
    game_result = described_class.new("Capitola Seahorses 1, Aptos FC 0")

    expect(game_result.left_team).to eq("Capitola Seahorses")
    expect(game_result.left_team_points).to eq(3)

    expect(game_result.right_team).to eq("Aptos FC")
    expect(game_result.right_team_points).to eq(0)
  end

  it "processes a right win correctly" do
    game_result = described_class.new("Felton Lumberjacks 1, Aptos FC 2")

    expect(game_result.left_team).to eq("Felton Lumberjacks")
    expect(game_result.left_team_points).to eq(0)

    expect(game_result.right_team).to eq("Aptos FC")
    expect(game_result.right_team_points).to eq(3)
  end

  it "processes a tie correctly" do
    game_result = described_class.new("Capitola Seahorses 5, San Jose Earthquakes 5")

    expect(game_result.left_team).to eq("Capitola Seahorses")
    expect(game_result.left_team_points).to eq(1)

    expect(game_result.right_team).to eq("San Jose Earthquakes")
    expect(game_result.right_team_points).to eq(1)
  end

  it "raises an error when given invalid input" do
    expect { described_class.new("Cap1t0la Seah0rses 5, San J0se Earthquakes 5") }
      .to raise_error("Invalid game result input format: Cap1t0la Seah0rses 5, San J0se Earthquakes 5")
  end
end

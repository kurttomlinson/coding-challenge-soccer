#!/usr/bin/env ruby

require "./league_standings.rb"
require "./game_result.rb"

GAMES_PER_MATCHDAY = 3

matchday = 1
leage_standings = LeagueStandings.new

loop do
  line = gets
  break if line == "\n"
  break unless line

  game_result = GameResult.new(line)
  leage_standings.record_game_result(game_result)

  if leage_standings.games_recorded % GAMES_PER_MATCHDAY == 0
    puts "Matchday #{matchday}"
    puts "#{leage_standings}\n\n"
    matchday += 1
  end
end

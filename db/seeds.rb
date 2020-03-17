require_relative('../models/team')
require_relative('../models/match')
require_relative('../models/result')

Result.delete_all
Team.delete_all
Match.delete_all

team1 = Team.new({'name' => 'Leith Honey Badgers', 'wins' => 0,'losses' => 0})
team2 = Team.new({'name' => 'Edinburgh Titans', 'wins' => 0,'losses' => 0})
team3 = Team.new({'name' => 'Edinburgh Soldier Bears', 'wins' => 0,'losses' => 0})
team4 = Team.new ({'name' => 'Edinburgh Iberians','wins' => 0, 'losses' => 0})

match1 = Match.new({'home_team' => 'Leith Honey Badgers', 'away_team' => 'Edinburgh Titans', 'home_score' => 72, 'away_score' => 68})
match2 = Match.new({'home_team' => 'Edinburgh Soldier Bears', 'away_team' => 'Edinburgh Iberians', 'home_score' => 54, 'away_score' => 41})
match3 = Match.new({'home_team' => 'Edinburgh Iberians', 'away_team' => 'Leith Honey Badgers', 'home_score' => 58, 'away_score' => 69})
match4 = Match.new({'home_team' => 'Edinburgh Titans', 'away_team' => 'Edinburgh Soldier Bears', 'home_score' => 51, 'away_score' => 37})

team1.save()
team2.save()
team3.save()
team4.save()

match1.save()
match2.save()
match2.save()
match4.save()

result1 = Result.new({'team_id' => team1.id, 'match_id' => match1.id})
result2 = Result.new({'team_id' => team3.id, 'match_id' => match2.id})
# result3 = Result.new({'team_id' => team1.id, 'match_id' => match3.id})
# result4 = Result.new({'team_id' => team2.id, 'match_id' => match4.id})


result1.save()
result2.save()
# result3.save()
# result4.save()

# binding.pry
# nil

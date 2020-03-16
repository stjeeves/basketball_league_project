require_relative('../models/team')
require_relative('../models/match')
require_relative('../models/result')

Team.delete_all
Match.delete_all

team1 = Team.new({'name' => 'Leith Honey Badgers', 'wins' => 0,'losses' => 0})
team2 = Team.new({'name' => 'Edinburgh Titans', 'wins' => 0,'losses' => 0})
team3 = Team.new({'name' => 'Edinburgh Soldier Bears', 'wins' => 0,'losses' => 0})
team4 = Team.new ({'name' => 'Edinburgh Iberians','wins' => 0, 'losses' => 0})

match1 = Match.new({'home_team' => 'Leith Honey Badgers','away_team' => 'Edinburgh Titans'})
match2 = Match.new({'home_team' => 'Edinburgh Soldier Bears', 'away_team' => 'Edinburgh Iberians'})

team1.save()
team2.save()
team3.save()
team4.save()

match1.save()
match2.save()

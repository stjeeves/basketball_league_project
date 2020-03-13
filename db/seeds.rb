require_relative('../models/team')
require_relative('../models/match')
require_relative('../models/result')

Team.delete_all
Match.delete_all

team1 = Team.new({'name' => 'Leith Honey Badgers', 'wins' => 0,'losses' => 0})
team2 = Team.new({'name' => 'Edinburgh Titans', 'wins' => 0,'losses' => 0})

match1 = Match.new({'home_team' => 'Leith Honey Badgers','away_team' => 'Edinburgh Titans'})

team1.save()
team2.save()

match1.save

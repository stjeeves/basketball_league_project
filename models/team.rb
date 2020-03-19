require_relative('../db/sql_runner')
require_relative('result')
require('pry-byebug')


class Team

  attr_accessor :name, :wins, :losses
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
    @wins = options['wins']
    @losses = options['losses']
  end
#can remove wins and losses from here and get this information from results table
#to prevent duplicating data
def save()
  sql = "INSERT INTO teams
        (
          name,
          wins,
          losses)
        VALUES (
          $1,
          $2,
          $3
          )
          RETURNING *"
  values = [@name, @wins, @losses]
  team_data = SqlRunner.run(sql, values)
  @id = team_data.first['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM teams"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM teams WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def update
  sql = "UPDATE teams SET (
          name,
          wins,
          losses
          ) = (
          $1, $2, $3
          ) WHERE id = $4
          "
  values = [@name, @wins, @losses, @id]
  SqlRunner.run(sql, values)
end

def self.all
  sql = "SELECT * FROM teams"
  teams = SqlRunner.run(sql)
  results = teams.map { |team| Team.new(team)  }
  return results
end

def self.find_by_id(id)
  sql = "SELECT * FROM teams WHERE id = $1"
  values = [id]
  team_data = SqlRunner.run(sql, values)
  results = team_data.map{ |team| Team.new(team)}
  return results.first
end

def matches_played
    sql = "SELECT matches.* FROM matches
           INNER JOIN results
           ON results.match_id = matches.id WHERE results.team_id = $1"
           values = [@id]
           matches = SqlRunner.run(sql, values)
           results = matches.map{ |match| Match.new(match)}
           return results[0]

           #is returning an array of of all matches. need to be able to show the
           # just the matches they've played
  end

# team1 = Team.new({'id' => 1, 'name' => 'Leith Honey Badgers', 'wins' => 0,'losses' => 0})


def wins()
  #check the results table for the relevant team_id
  #return the amount it appears as an array
  #count the amount of appearances in the array
  sql = "SELECT * FROM results WHERE team_id = $1"
  values = [@id]
  wins = SqlRunner.run(sql, values)
  return wins.count
end

# binding.pry
# nil


end

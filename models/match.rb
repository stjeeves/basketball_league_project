require_relative('../db/sql_runner')

class Match


  attr_accessor :home_team, :away_team
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @home_team = options['home_team']
    @away_team = options['away_team']
  end

  def save()
    sql = "INSERT INTO matches
          (
            home_team,
            away_team)
          VALUES (
            $1,
            $2
            )
            RETURNING *"
    values = [@home_team, @away_team]
    match_data = SqlRunner.run(sql, values)
    @id = match_data.first['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

  def teams
      sql = "SELECT matches.* FROM matches
             INNER JOIN results ON results.match_id = match_id WHERE team_id = $1"
             values = [@id]
             stars = SqlRunner.run(sql, values)
             results = matches.map{ |match| Match.new(match)}
             return results
    end

end

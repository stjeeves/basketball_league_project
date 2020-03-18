require_relative('../db/sql_runner')

class Match


  attr_accessor :home_team, :away_team, :home_score, :away_score
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @home_team = options['home_team']
    @away_team = options['away_team']
    @home_score = options['home_score']
    @away_score = options ['away_score']
  end

  def save()
    sql = "INSERT INTO matches
          (
            home_team,
            away_team,
            home_score,
            away_score)
          VALUES (
            $1,
            $2,
            $3,
            $4
            )
            RETURNING *"
    values = [@home_team, @away_team, @home_score, @away_score]
    match_data = SqlRunner.run(sql, values)
    @id = match_data.first['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM matches"
    matches = SqlRunner.run(sql)
    result = matches.map{ |match| Match.new(match)}
    return result
  end

  def teams
      sql = "SELECT teams.* FROM teams
             INNER JOIN results ON results.match_id = match_id WHERE team_id = $1"
             values = [@id]
             stars = SqlRunner.run(sql, values)
             results = matches.map{ |match| Match.new(match)}
             return results
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM matches WHERE id = $1"
      values = [id]
      match_data = SqlRunner.run(sql, values)
      results = match_data.map{ |match| Match.new(match)}
      return results.first
    end
end

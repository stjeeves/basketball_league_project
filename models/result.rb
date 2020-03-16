require_relative('../db/sql_runner')
require_relative('team')
require_relative('match')

class Result

  attr_reader :id, :team_id, :match_id, :winner

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @team_id = options['team_id'].to_i
    @match_id = options['match_id'].to_i
    @winner = options['winner']
  end

  def save()
    sql = "INSERT INTO results(
          team_id,
          match_id,
          winner) VALUES(
            $1,
            $2,
            $3
            ) RETURNING *"
    values = [@team_id, @match_id, @winner]
    match_result = SqlRunner.run(sql, values)
    @id = match_result.first['id'].to_i
  end

end

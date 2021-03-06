require_relative('../db/sql_runner')
require_relative('team')
require_relative('match')
require('pry-byebug')

class Result

  attr_reader :id, :team_id, :match_id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @team_id = options['team_id'].to_i
    @match_id = options['match_id'].to_i
  end

  def save()
    sql = "INSERT INTO results(
          team_id,
          match_id)
           VALUES(
            $1,
            $2
            ) RETURNING *"
    values = [@team_id, @match_id]
    match_result = SqlRunner.run(sql, values)
    @id = match_result.first['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM results"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM results WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  #
  # binding.pry
  # nil


end

require_relative('../db/sql_runner')
require_relative('team')
require_relative('match')

class Result

  attr_reader :id, :team_id, :match_id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @team_id = options['team_id'].to_i
    @match_id = options['match_id'].to_i
  end

end

require_relative('../db/sql_runner')

class Match


  attr_accessor :home_team, :away_team
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @home_team = options['home_team']
    @away_team = options['away_team']

end

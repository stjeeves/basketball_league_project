require_relative('../db/sql_runner')

class Team

  attr_accessor :name, :wins, :losses
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
    @wins = options['wins']
    @losses = options['losses']
  end

end

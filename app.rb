require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/team_controller')
require_relative('controllers/matches_controller')
require_relative('models/match')
require_relative('models/team')
require_relative('models/result')
require_relative('db/seeds')

get '/' do
  erb( :index )
end

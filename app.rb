require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/team_controller')
require_relative('controllers/matches_controller')

get '/' do
  erb( :index )
end

require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/match')
require_relative('../models/result')
require_relative('../models/team')
also_reload('../models/*')

get '/matches' do
  @matches = Match.all()
  erb(:"matches/index")
end

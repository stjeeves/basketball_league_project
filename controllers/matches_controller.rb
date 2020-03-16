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

get '/matches/new' do
  erb(:"matches/new")
end

post '/matches' do #also create
  @matches = Match.new(params)
  @matches.save()
  erb (:"matches/create")
end

get '/matches/:id' do #read also
  @matches = Match.find_by_id(params[:id])
  erb (:"matches/show")
end

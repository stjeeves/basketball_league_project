require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/match')
require_relative('../models/result')
require_relative('../models/team')
also_reload('../models/*')

get '/teams' do #read
  @teams = Team.all()
  erb (:"teams/index")
end

get '/teams/new' do #create
  erb (:"teams/new")
end

get '/teams/:id/delete' do #delete
team = Team.find_by_id(params[:id])
team.delete
redirect to '/teams'
end

get '/teams/:id' do #read also
  @team = Team.find_by_id(params[:id])
  erb (:"teams/show")
end

get '/teams/:id/edit' do #update
@team = Team.find_by_id(params[:id])
  erb(:"teams/edit")
end

post '/teams/:id' do #update
  Team.new(params).update
  redirect to '/teams'
end

post '/teams' do #also create
  @teams = Team.new(params)
  @teams.save()
  erb (:"teams/create")
end

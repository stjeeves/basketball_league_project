require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/match')
require_relative('./models/result')
require_relative('./models/team')
also_reload('./models/*')

get '/teams' do #read
  @teams = Team.all()
  erb (:index)
end

get '/teams/new' do #create
  erb (:new)
end

post '/teams' do #also create
  @teams = Team.new(params)
  @teams.save()
  erb (:create)
end

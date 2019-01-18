require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require_relative('./models/characters')
require_relative('./models/teams')
also_reload('./models/*')

get '/' do
 erb(:home)
end

get '/teams' do
  @teams = Team.all()
  # @team_score = team(params).score()
  erb(:teams)
end

get'/admin' do

  erb(:admin_home)
end

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

  erb(:teams)
end


# admin flow (full rest) for both teams and characters

get'/admin' do

  erb(:admin_home)
end

# TEAMS
# INDEX
get '/admin-teams' do
  @teams = Team.all()

  erb :"admin-teams/index", :layout => :admin_layout
end

# NEW
get '/admin-teams/new' do

  erb :"admin-teams/new", :layout => :admin_layout
end

#CREATE
post '/admin-teams' do
  # Create a new Teams object
  Team.new( params ).save
  # Save to the db
  # Redirect the browser to the list of teams
  redirect to './admin-teams'
end
#SHOW
get '/admin-teams/:id' do
  #Retrieve one pizza order from the db
  @team_show = Team.find(params[:id])
  # Display the details of that order
  erb :"admin-teams/show", :layout => :admin_layout
end
#EDIT
get '/admin-teams/:id/edit' do
  # show existing data from db in form - editable
@team_show = Team.find(params[:id])
  erb :"admin-teams/edit", :layout => :admin_layout
end
#UPDATE
put '/admin-teams/:id' do
  # Create a new Team object
  edit_team = Team.find(params[:id])
  edit_team.team_name=(params[:team_name])
  edit_team.owner=(params[:owner])
  edit_team.update
  # Save to the db
  # Redirect the browser to 'teams list'
  redirect to '/admin-teams'
end
#DESTROY
delete '/admin-teams/:id' do
  # Retrieve the pizza order from db and delete it
  Team.find(params[:id]).delete
  # Redirect the browser to '/pizza-orders'
  redirect to '/admin-teams'
end


# CHARACTERS
# INDEX
get '/admin-characters' do
  @characters = Character.all()

  erb :"admin-characters/index", :layout => :admin_layout
end
# NEW
get '/admin-characters/new' do

  erb :"admin-characters/new", :layout => :admin_layout
end

# #CREATE
# post '/admin-teams' do
#   # Create a new Teams object
#   Team.new( params ).save
#   # Save to the db
#   # Redirect the browser to the list of teams
#   redirect to './admin-teams'
# end
# #SHOW
# get '/admin-teams/:id' do
#   #Retrieve one pizza order from the db
#   @team_show = Team.find(params[:id])
#   # Display the details of that order
#   erb :"admin-teams/show", :layout => :admin_layout
# end
# #EDIT
# get '/admin-teams/:id/edit' do
#   # show existing data from db in form - editable
# @team_show = Team.find(params[:id])
#   erb :"admin-teams/edit", :layout => :admin_layout
# end
# #UPDATE
# put '/admin-teams/:id' do
#   # Create a new Team object
#   edit_team = Team.find(params[:id])
#   edit_team.team_name=(params[:team_name])
#   edit_team.owner=(params[:owner])
#   edit_team.update
#   # Save to the db
#   # Redirect the browser to 'teams list'
#   redirect to '/admin-teams'
# end
# #DESTROY
# delete '/admin-teams/:id' do
#   # Retrieve the pizza order from db and delete it
#   Team.find(params[:id]).delete
#   # Redirect the browser to '/pizza-orders'
#   redirect to '/admin-teams'
# end

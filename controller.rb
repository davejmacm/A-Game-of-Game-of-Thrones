require( 'sinatra' )
require( 'sinatra/reloader' ) if development?
require_relative('./models/characters')
require_relative('./models/teams')
also_reload('./models/*')

# User routes (limited RESTful routes)
get '/' do
  @teams = Team.all_by_score()

 erb(:home)
end

get '/teams' do
  @teams = Team.all_by_score()

  erb(:"user/teams")
end

get '/characters' do
  @characters = Character.all()

  erb(:"user/characters")
end

#SHOW ALL TEAMS
get '/teams/:id' do
  #Retrieve one team from the db
  @team_show = Team.find(params[:id])
  # Display the details of that team
  erb :"user/show_team"
end

# Team update - team_name ONLY
#EDIT
get '/teams/:id/edit' do
  # show existing data from db in form - editable
@team_show = Team.find(params[:id])
  erb :"user/team_edit"
end
#UPDATE
put '/teams/:id' do
  # Create a new Team object
  edit_team = Team.find(params[:id])
  edit_team.team_name=(params[:team_name])
  edit_team.update
  # Save to the db
  # Redirect the browser to 'teams list'
  redirect to '/teams'
end

#SHOW
get '/characters/:id' do
  #Retrieve one Character from the db
  @character_show = Character.find(params[:id])
  # Display the details of that order
  erb :"user/show_character"
end
# ===================================================
#EDIT
get '/characters/:id/drop' do
  # show existing data from db in form - editable
@character_show = Character.find(params[:id])
@teams = Team.all()
  erb :"user/drop"
end
#UPDATE
put '/characters/:id' do
  # Create a new Character object
  edit_character = Character.find(params[:id])
  edit_character.team_id=0
  edit_character.update
  # Save to the db
  # Redirect the browser to 'character list'
  redirect to '/teams/:id'
end
# ========================================
# route to scoring page for users
get '/scoring' do
  erb :"user/scoring"
end


# admin flow (full rest) for both teams and characters

get'/admin' do

  erb :admin_home, :layout => :admin_layout
end

# TEAMS
# INDEX
get '/admin-teams' do
  @teams = Team.all_by_score()

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
  #Retrieve one team from the db
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
@teams = Team.all()
  erb :"admin-characters/new", :layout => :admin_layout
end

#CREATE
post '/admin-characters' do
  # Create a new Character object
  Character.new( params ).save
  # Save to the db
  # Redirect the browser to the list of characters
  redirect to './admin-characters'
end
#SHOW
get '/admin-characters/:id' do
  #Retrieve one Character from the db
  @character_show = Character.find(params[:id])
  # Display the details of that order
  erb :"admin-characters/show", :layout => :admin_layout
end
#EDIT
get '/admin-characters/:id/edit' do
  # show existing data from db in form - editable
@character_show = Character.find(params[:id])
@teams = Team.all()
  erb :"admin-characters/edit", :layout => :admin_layout
end
#UPDATE
put '/admin-characters/:id' do
  # Create a new Character object
  edit_character = Character.find(params[:id])
  edit_character.name=(params[:name])
  edit_character.bio=(params[:bio])
  edit_character.pic_url=(params[:pic_url])
  edit_character.score=(params[:score])
  edit_character.team_id=(params[:team_id])
  edit_character.update
  # Save to the db
  # Redirect the browser to 'character list'
  redirect to '/admin-characters'
end
#DESTROY
delete '/admin-characters/:id' do
  # Retrieve the pizza order from db and delete it
  Character.find(params[:id]).delete
  # Redirect the browser to '/pizza-orders'
  redirect to '/admin-characters'
end

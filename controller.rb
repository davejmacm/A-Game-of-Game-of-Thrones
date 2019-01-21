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
# #UPDATE
# put '/pizza-orders/:id' do
#   # Create a new pizzaOrder object
#   edit_order = PizzaOrder.find(params[:id])
#   edit_order.first_name=(params[:first_name])
#   edit_order.last_name=(params[:last_name])
#   edit_order.quantity=(params[:quantity])
#   edit_order.topping=(params[:topping])
#   edit_order.update
#   # Save to the db
#   # Redirect the browser to '/pizza-orders'
#   redirect to '/pizza-orders'
# end
# #DESTROY
# delete '/pizza-orders/:id' do
#   # Retrieve the pizza order from db and delete it
#   PizzaOrder.find(params[:id]).delete
#   # Redirect the browser to '/pizza-orders'
#   redirect to '/pizza-orders'
# end


# CHARACTERS
# INDEX
get '/admin-characters' do
  @characters = Character.all()

  erb(:"admin-characters/index")
end

require_relative('../db/sql_runner')

class Character

  attr_reader :id
  attr_accessor :name, :bio, :pic_url, :score, :team_id

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @name = options['name']
   @bio = options['bio']
   @pic_url = options['pic_url']
   @score = options['score'].to_i
   @team_id = options['team_id'].to_i
 end


# CRUD methods
VARa = "characters"
VARb = "name"
VARc = "bio"
VARe = "pic_url"
VARf = "score"
VARg = "team_id"
d = "character"

def save()
   sql = "INSERT INTO #{VARa}(
         #{VARb},
         #{VARc},
         #{VARe},
         #{VARf},
         #{VARg}
         )
         VALUES ($1, $2, $3, $4, $5)
         RETURNING id"
  values = [@name, @bio, @pic_url, @score, @team_id]
  d = SqlRunner.run(sql, values).first
  @id = d ['id'].to_i
 end

 def self.delete_all()
   sql = "DELETE FROM #{VARa}"
   SqlRunner.run(sql)
 end

 def delete()
   sql = "DELETE FROM #{VARa}
         WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end
# ==================================
 def self.all()
   sql = "SELECT * FROM #{VARa}"
   characters = SqlRunner.run(sql)
   return characters.map {|character| Character.new (character)}
 end

 def self.find( id )
  sql = "SELECT * FROM characters WHERE id = $1"
  values = [id]
  character = SqlRunner.run( sql, values )
  result = Character.new( character.first )
  return result
 end

 def update()
   sql = "UPDATE #{VARa}
   SET(
     #{VARb}, #{VARc}, #{VARe}, #{VARf}, #{VARg}
     )
     =
     ($1, $2, $3, $4, $5)
     WHERE id = $6"
     values = [@name, @bio, @pic_url, @score, @team_id, @id]
     SqlRunner.run(sql, values)
 end

 # end of crud functionality; below is lookup methods

# this method will return the team the character is part of
 def team()
   sql = "SELECT team_name
         FROM teams

         WHERE id = $1"
   values = [@team_id]
   team = SqlRunner.run(sql, values)
   return team.map{|team| Team.new(team)}
 end

def team_null ()
  sql = "Update characters
  SET team_id = NULL
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

# def cost()
#   sql = "UPDATE customers
#   SET funds = (SELECT customers.funds - films.price
#         FROM customers
#         INNER JOIN tickets
#           ON tickets.customer_id = customers.id
#         INNER JOIN films
#           ON tickets.film_id = films.id
# 		WHERE tickets.id = $1)
#     WHERE customers.id = $2
#     RETURNING funds"
#     values = [@id, @name]
#     result = SqlRunner.run(sql, values)
#     return result[0]['funds'].to_f



# end



end

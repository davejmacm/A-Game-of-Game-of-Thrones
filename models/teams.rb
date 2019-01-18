require_relative('../db/sql_runner')
# require_relative('../characters')

class Team

  attr_reader :id
  attr_accessor :owner, :team_name

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @owner = options['owner']
   @team_name = options['team_name']
 end


# CRUD methods
VARa = "teams"
VARb = "owner"
VARc = "team_name"
d = "team"

def save()
   sql = "INSERT INTO #{VARa}(
         #{VARb},
         #{VARc}
         )
         VALUES ($1, $2)
         RETURNING id"
  values = [@owner, @team_name]
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
# ==========================
 def self.all()
   sql = "SELECT * FROM teams"
   teams = SqlRunner.run(sql)
   return teams.map {|team| Team.new (team)}
 end

 def update()
   sql = "UPDATE #{VARa}
   SET(
     #{VARb}, #{VARc}
     )
     =
     ($1, $2)
     WHERE id = $3"
     values = [@owner, @team_name, @id]
     SqlRunner.run(sql, values)
 end

 # end of crud functionality; below is lookup methods


# this method will return all characters assigned to a particular team
 def characters()
   sql = "SELECT name
         FROM characters

         WHERE team_id = $1"
   values = [@id]
   characters = SqlRunner.run(sql, values)
   return  characters.map{|character| Character.new(character)}
 end

 # this method will return the SUMMED value of score for all characters on that particular teams

 def score()
   sql = "SELECT SUM(score)
          FROM characters
          WHERE team_id = $1"
   values = [@id]
   score = SqlRunner.run(sql,values)
   return score[0]
 end

   # sql = "UPDATE customers
   # SET funds = (SELECT customers.funds - films.price
   #       FROM customers
   #       INNER JOIN tickets
   #         ON tickets.customer_id = customers.id
   #       INNER JOIN films
   #         ON tickets.film_id = films.id
 		# WHERE tickets.id = $1)
   #   WHERE customers.id = $2
   #   RETURNING funds"
   #   values = [@id, @owner]
   #   result = SqlRunner.run(sql, values)
   #   return result[0]['funds'].to_f

end

require_relative('../db/sql_runner')

class Character

  attr_reader :id
  attr_accessor :name, :bio, :pic_url, :score, :team_id

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @param_1 = options['name']
   @param_2 = options['bio']
   @param_3 = options['pic_url']
   @param_4 = options['score'].to_i
   @param_5 = options['team_id'].to_i
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
  values = [@param_1, @param_2, @param_3, @param_4, @param_5]
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
   d = SqlRunner.run(sql)
   return d.map {|character| Character.new (d)}
 end

 def update()
   sql = "UPDATE #{VARa}
   SET(
     #{VARb}, #{VARc}, #{VARe}, #{VARf}, #{VARg}
     )
     =
     ($1, $2, $3, $4, $5)
     WHERE id = $6"
     values = [@param_1, @param_2, @param_3, @param_4, @param_5, @id]
     SqlRunner.run(sql, values)
 end

 # end of crud functionality; below is lookup methods

 def team()
   sql = "SELECT team_name
         FROM teams

         WHERE id = $1"
   values = [@param_5]
   team = SqlRunner.run(sql, values)
   return team.map{|team| Team.new(team)}
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
#     values = [@id, @param_1]
#     result = SqlRunner.run(sql, values)
#     return result[0]['funds'].to_f



# end



end

require_relative('../db/sql_runner')

class Team

  attr_reader :id
  attr_accessor :owner, :team_name

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @param_1 = options['owner']
   @param_2 = options['team_name']
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
  values = [@param_1, @param_2]
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
   sql = "SELECT * FROM #{VARa}"
   d = SqlRunner.run(sql)
   return d.map {|team| Team.new (d)}
 end

 def update()
   sql = "UPDATE #{VARa}
   SET(
     #{VARb}, #{VARc}
     )
     =
     ($1, $2)
     WHERE id = $3"
     values = [@param_1, @param_2, @id]
     SqlRunner.run(sql, values)
 end

 # end of crud functionality; below is lookup methods

 def team()
   sql = "SELECT name
         FROM characters

         WHERE team_id = $1"
   values = [@id]
   character = SqlRunner.run(sql, values)
   return  character.map{|character| Character.new(character)}
 end

end

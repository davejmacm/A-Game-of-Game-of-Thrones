require('pg')
class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'got', host: 'localhost' })
      db = PG.connect({
        dbname: 'dbln3fmie78oop',
        host: 'ec2-54-225-89-195.compute-1.amazonaws.com',
        port: 5432,
        user: 'yrdraclipzqvij',
        password: 'e2c3af00a4a98b0865548839f199659a4bf8b02261752c9685c134d0ec787bab'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end

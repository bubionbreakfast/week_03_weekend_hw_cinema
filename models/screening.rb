require_relative('../db/sql_runner')
require_relative('./ticket')
require_relative('./customer')
require_relative('./film')

class Screening
  attr_accessor :film_time
  attr_reader  :id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @film_time = options['film_time']
end

def get_time()
  return @film_time
end

def tickets()
  sql = "SELECT * FROM tickets WHERE screening_id = $1"
  values = [@id]
  screening_data = SqlRunner.run(sql, values)
  return screening_data.map{|screening|Screening.new(screening)}
end

def film()
  sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE screening_id = $1"
  values = [@id]
  customer_data = SqlRunner.run(sql, values)
  return Customer.map_items(customer_data)
end

def customers_all()
  sql = "SELECT * FROM tickets WHERE customer_id = $1"
  values = [@id]
  customer_data = SqlRunner.run(sql, values)
  total = customer_data.map{|customer| Customer.new(customer)}
  return total.count
end

def save()
  sql = "
  INSERT INTO screenings
  (film_time)
  VALUES
  ($1)
  RETURNING *"
  values = [@film_time]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def update()
  sql = "UPDATE screenings SET (film_time) = ($1) WHERE id = $2"
  values = [@film_time, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM screenings where id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM screenings"
  screening_data = SqlRunner.run(sql)
  return Screening.map_items(screening_data)
end

def self.map_items(data)
  result = data.map{|screening| Screening.new(screening)}
  return result
end

end

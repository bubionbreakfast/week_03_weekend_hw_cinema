require_relative("../db/sql_runner")
require_relative('./ticket')
require_relative('./customer')
require_relative('./film')
require_relative('./screening')

class Film
  attr_accessor :title, :price
  attr_reader  :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
    @screening_id = options['screening_id'].to_i if options['screening_id']

  end

  def get_price
    return @price
  end

  def customers()
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return customer_data.map{|customer| Customer.new(ticket)}
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
    INSERT INTO films
    (title, price)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  def screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON screening_id.id = tickets.screening_id WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_data = SqlRunner.run(sql)
    return Film.map_items(film_data)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end

end

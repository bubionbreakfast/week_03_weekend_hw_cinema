require_relative('../db/sql_runner')
require_relative('./ticket')
require_relative('./customer')
require_relative('./film')

class Customer
  attr_accessor :name, :funds
  attr_reader  :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    # @customer_id = options['customer_id'].to_i if options['customer_id']
    # @film_id = options['film_id'].to_i if options['film_id']
    @funds = options['funds']
  end

  def tickets()
    sql = "SELECT * FROM tickets where film_id = $1"
    values = [@id]
    ticket_data = SqlRunner.run(sql, values)
    return ticket_data.map{|film| Ticket.new(film)}
  end

  # def ()
  #   sql = "SELECT * FROM tickets where film_id = $1"
  #   values = [@id]
  #   ticket_data = SqlRunner.run(sql, values)
  #   return ticket_data.map{|ticket| Ticket.new(ticket)}
  # end

  def remaining_budget()
    tickets = self.tickets()
    ticket_fees = tickets.map{|ticket| film.price}
    combined_fees = ticket_fees.sum
    return @funds - combined_fees
    # return @funds - ticket_fees
  end

  def save()
    sql = "
    INSERT INTO customers
    (name, funds)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_data = SqlRunner.run(sql)
    return Customer.map_items(customer_data)
  end

  def self.map_items(data)
    result = data.map{|customer| Customer.new(customer)}
    return result
  end


end

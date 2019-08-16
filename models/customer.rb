require_relative('../db/sql_runner')
require_relative('./ticket')
require_relative('./customer')
require_relative('./film')

class Customer

  attr_reader :name, :funds, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    # @customer_id = options['customer_id'].to_i if options['customer_id']
    # @film_id = options['film_id'].to_i if options['film_id']
    @funds = options['funds']
  end

  def save()
    sql = "
      INSERT INTO customers
      (name, funds
      )
      VALUES
      ($1, $2)
      RETURNING *
      "
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end






end

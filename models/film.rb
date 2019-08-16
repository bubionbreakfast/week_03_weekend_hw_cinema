require_relative("../db/sql_runner")
# require_relative('./ticket')
require_relative('./customer')
require_relative('./film')

class Film

  attr_reader :title, :price, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i

  end

  def save()
    sql = "
      INSERT INTO films
      (title, price
      )
      VALUES
      ($1, $2)
      RETURNING *
      "
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

end

require_relative('../db/sql_runner')
require_relative('./ticket')
require_relative('./customer')
require_relative('./film')

class Screening
  attr_accessor :time
  attr_reader  :id


end

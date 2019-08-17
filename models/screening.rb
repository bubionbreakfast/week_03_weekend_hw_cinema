require_relative('../db/sql_runner')
require_relative('./ticket')
require_relative('./customer')
require_relative('./film')

class Screening
  attr_accessor :time
  attr_reader  :id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @time = options['time']
end

def get_time()
  return @time
end

end

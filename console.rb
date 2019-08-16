require_relative('./db/sql_runner')
require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/ticket')
require ('pry')


Film.delete_all()
Customer.delete_all()
Ticket.delete_all()



customer1 = Customer.new({'name' => 'Bob', 'funds' => 100})
customer1.save()

customer2 = Customer.new({'name' => 'Jane', 'funds' => 50})
customer2.save()

customer3 = Customer.new({'name'=> 'Tony', 'funds' => 25})
customer3.save()

film1 = Film.new({'title' => 'Tron', 'price' => 10})
film1.save()

film2 = Film.new({'title' => 'Krull', 'price' => 20})
film2.save()

film3 = Film.new({'title' => 'Predator 2', 'price' => 7})
film3.save()

ticket1 = Ticket.new( { 'customer_id' => customer1.id, 'film_id' => film1.id})
# casting1 = Casting.new( { 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 50000 } )
ticket1.save()

ticket2 = Ticket.new( { 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()


ticket3 = Ticket.new( { 'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save()




binding.pry
nil

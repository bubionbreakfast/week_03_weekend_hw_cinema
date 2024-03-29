## CodeClan Cinema (CCC (again))

:star: This is a PDA Homework :star:

Create a system that handles bookings for our newly built cinema!
It's enough if you can call your methods in pry, don't worry about an interface.

### Your app should have:
  - Customers
    - name
    - funds

  - Films
    - title
    - price

  - Tickets
    - customer_id
    - film_id

### Your app should be able to:
  - Create customers, films and tickets
  - CRUD actions (create, read, update, delete) customers, films and tickets.
  - Show which films a customer has booked to see, and see which customers are coming to see one film.

### Basic extensions:
  - Buying tickets should decrease the funds of the customer by the price
  <!-- [2] pry(main)> customer1.buy(film1)
=> 90 -->
  - Check how many tickets were bought by a customer
  <!-- [9] pry(main)> customer2.tickets
=> [#<Ticket:0x007fe0b8302c30 @customer_id=194, @film_id=194, @id=206>,
 #<Ticket:0x007fe0b8302b68 @customer_id=194, @film_id=193, @id=209>]
[10] pry(main)> -->
<!-- [1] pry(main)> customer1.tickets_all
=> 2
[2] pry(main)> customer3.tickets_all
=> 1
[3] pry(main)> customer2.tickets_all
=> 2 -->
  - Check how many customers are going to watch a certain film
  <!-- [10] pry(main)> film1.customers
=> [#<Customer:0x007fe0b890add0 @funds="100", @id=193, @name="Bob">,
 #<Customer:0x007fe0b890ad08 @funds="50", @id=194, @name="Jane">]
[11] pry(main)>  -->
<!-- [11] pry(main)> film1.customers.count
=> 2
[12] pry(main)> film3.customers.count
=> 1 -->
<!-- [1] pry(main)> film1.customers_all
=> 2 -->

### Advanced extensions:
  - Create a screenings table that lets us know what time films are showing
  <!-- [3] pry(main)> screening1.tickets
=> []
[4] pry(main)> screening1.get_time
=> "18:00"
[5] pry(main)> Screening.all
=> [#<Screening:0x007fdc4ab0afa8 @film_time=nil, @id=1>,
 #<Screening:0x007fdc4ab0ac60 @film_time="18:00", @id=7>,
 #<Screening:0x007fdc4ab0ab70 @film_time="22:00", @id=8>,
 #<Screening:0x007fdc4ab0aa80 @film_time="23:30", @id=9>,
 #<Screening:0x007fdc4ab0a9e0 @film_time="18:00", @id=10>,
 #<Screening:0x007fdc4ab0a8f0 @film_time="22:00", @id=11>,
 #<Screening:0x007fdc4ab0a828 @film_time="23:30", @id=12>,
 #<Screening:0x007fdc4ab0a760 @film_time="18:00", @id=13>,
 #<Screening:0x007fdc4ab0a648 @film_time="22:00", @id=14>,
 #<Screening:0x007fdc4ab0a530 @film_time="23:30", @id=15>,
 #<Screening:0x007fdc4ab0a440 @film_time="18:00", @id=16>,
 #<Screening:0x007fdc4ab0a378 @film_time="22:00", @id=17>,
 #<Screening:0x007fdc4ab0a2d8 @film_time="23:30", @id=18> -->
  - Write a method that finds out what is the most popular time (most tickets sold) for a given film
  - Limit the available tickets for screenings.
  - Add any other extensions you think would be great to have at a cinema!

### PDA Reminder:

As part of this homework you are required to take screenshots of the following:

```
Demonstrate searching data in a program. Take screenshots of:
 - Function that searches data
 - The result of the function running
```

```
Demonstrate sorting data in a program. Take screenshots of:
 - Function that sorts data
 - The result of the function running
```

- Go to your [PDA Checklist](https://github.com/codeclan/pda/tree/master/Evidence%20Gathering%20Portfolio)

- Submit your PDA evidence (screenshots, etc.) to your own PDA repo

- PDA Reference: I.T 3 & I.T 4

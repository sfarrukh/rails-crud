## Required Installations:
1. [Ruby](https://www.ruby-lang.org/en/downloads/)
	
2. Ruby on Rails Framwork. From terminal/cmd:
```
gem install rails
```
3. [MYSQL Server](https://dev.mysql.com/downloads/mysql/)



## Project Configurations:
1. Clone 'rails-crud' project to 'your destination'
```
cd 'your destination'
git clone https://github.com/sfarrukh/rails-crud.git
```

2. Install bundle
```
cd 'rails-crud'
bundle install
```
3. Change username/password in 'rails-crud/config/database.yml' to match your mysql database username/password:
```ruby
username: 'your username'
password: 'your password'
```

4. Run migrations for the project to build its tables on sakila database:
```
rails db:migrate
```

5. rails-crud has 3 environments: admin, staff & public/account. Public does not require login, admin and staff does. Create one from rails console:
```
rails console

admin = Admin.new()
admin.first_name = <First Name>
admin.last_name = <Last Name>
admin.email = <Email Address>
admin.username = <no less than 8 characters>
admin.password = <your password>
admin.save

staff = Staff.new()
staff.first_name = <First Name>
staff.last_name = <Last Name>
staff.email = <Email Address>
staff.username = <no less than 8 charachters>
staff.password = <your password>
staff.save
```

6. Run Server:
```
rails server --port:4200
```

7. Open your browser, navigate to:
* 'localhost:4200' for public access
* 'localhost:4200/admin' for admin access & login using admin account created above
* 'localhost:4200/staff' for staff access & login using staff account created above


## Project Architecture
Rails-Crud project is a sample online rental store, which makes use of sample database [sakila](https://dev.mysql.com/doc/sakila/en/) with a few table additions.

#### Project uses following tables from sakila database:
* Table Name
* Actor
* Address
* Category
* City
* Country
* Customer
* Film
* Film Actor
* Film Category
* Inventory
* Rental


#### Added tables:
* Admin
* Customer Payment Info
* Rental Pending
* Staff


#### Tables are inter-connected through foreign keys or through other tables, and those connections are defined in project's app/models:

| Table 1 connects	| Table 2				| through table	| through foreign key 	|
|-------------------|-----------------------|---------------|-----------------------|
| actor				| film					| film_actor	|					  	|
| film 				| category 				| film_category	|						|
| film 				| inventory 			| 				| film_id				|
| film 				| rental 				| inventory 	| 						|
| film 				| rentals_pending		| 				| film_id 				|
| customer 			| rental 				| 				| customer_id 			|
| customer 			| inventory 			| rental 		| 						|
| customer 			| films 				| inventory 	| 						|
| customer 			| customer_payment_info	| 				| customer_id 			|
| customer 			| address 				| 				| address_id 			|

#### The project has 3 category of participants with their functions:

* Public: reads `film, actor` tables, creates account in `customer` table, places order by creating row in `rental_pending` table (before checkout, application requires to create an account)
* Staff: reads `rental_pending` table, processes order by locating item from `inventory` table, ships item to customer's address & creates record to `rental` table
* Admin: creates, reads, updates, deletes `actor, film, customer, staff` tables


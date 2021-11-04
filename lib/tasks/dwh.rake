namespace :dwh do
    require 'pg'
    class Lead < ActiveRecord::Base
    end
    class Quote < ActiveRecord::Base # AU SINGULIER
    end
    class Customer < ActiveRecord::Base
    end
    class User < ActiveRecord::Base
    end
    class Elevator < ActiveRecord::Base
    end
    
    ActiveRecord::Base.establish_connection(
        { :adapter => 'mysql2',
          :database => 'Rocket_Elevators_Information_System_development',
          :host => 'localhost',
          :username => 'root',
          :password => "sgejzt23" }
       )
    task :create_table do
        # Output a table of current connections to the DB
        conn = PG.connect( dbname: 'data_warehouse', user: 'postgres', password: '123' )
        conn.exec( "
            CREATE TABLE FactQuotes (
                id INT PRIMARY KEY,
                created_at varchar(50),
                company_name varchar(50),
                email varchar(100),
                nb_elevators int);
                CREATE TABLE FactContact (
                id INT PRIMARY KEY,
                created_at varchar(1),
                company_name varchar(50),
                email varchar(100),
                project_name varchar(50));
                CREATE TABLE FactElevator (
                id INT PRIMARY KEY,
                serial_number varchar(100),
                date_of_commissioning varchar(1),
                building_id int,
                customer_id int,
                building_city varchar(75));
                CREATE TABLE DimCustomers (
                created_at varchar(1),
                company_name varchar(50),
                full_name_of_the_companys_main_contact varchar (100),
                email_of_the_companys_main_contact varchar(1),
                nb_elevators int,
                customers_city varchar(75));")
    end
    task :fill_tables do
        #     old_quotes = []
        # Quote.all.each { |quote| old_quotes << quote }
        # puts old_quotes[1].total_price
        conn = PG.connect( dbname: 'data_warehouse', user: 'postgres' )
        
        @quotes = Quote.all
        @leads = Lead.all
        @elevators = Elevator.all
        @customers = Customer.all
        @quotes.each do |q|
            conn.exec( "INSERT INTO FactQuotes (id, created_at, company_name, email, nb_elevators ) VALUES (#{q.id}, '#{q.created_at}', '#{q.company_name}', '#{q.email}', #{q.elevator_needed});" )
            puts q.created_at
        end
    end
end
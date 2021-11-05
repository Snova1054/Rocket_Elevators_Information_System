namespace :dwh do
    require 'pg'
    class Quote < ActiveRecord::Base # AU SINGULIER
    end
    class Lead < ActiveRecord::Base
    end
    class Elevator < ActiveRecord::Base
        belongs_to :column
    end
    class Customer < ActiveRecord::Base
        belongs_to :user
        has_many :building
        has_one :address
    end
        
    ActiveRecord::Base.establish_connection(
        { :adapter => 'mysql2',
          :database => 'Rocket_Elevators_Information_System_development',
          :host => 'localhost',
          :username => 'root',
          :password => "" }
       )
       
    task :create_table do
        # Output a table of current connections to the DB
        conn = PG.connect( dbname: 'data_warehouse', user: 'marcalexandreperussecavanagh' )
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
        conn = PG.connect( dbname: 'data_warehouse', user: 'marcalexandreperussecavanagh' )
        
        @quotes = Quote.all
        @leads = Lead.all
        @elevators = Elevator.all
        @customers = Customer.all
        @quotes.each do |q|
            conn.exec( "INSERT INTO FactQuotes (id, created_at, company_name, email, nb_elevators ) VALUES (#{q.id}, '#{q.created_at}', '#{q.company_name}', '#{q.email}', #{q.elevator_needed});" )

            # conn.exec( "INSERT INTO factcontact (id, creation_date, business_name, email, procject_name )
            # VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.business_name}', '#{lead.email}', '#{lead.project_name}');")

            # conn.exec( "INSERT INTO factelevator (id, serial_number, commissioning_date, building_id, customer_id, city )
            # VALUES (#{elevator.serial_number}, '#{elevator.date_service_since}', '#{elevator.column.battery.building.id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')")
   
            # conn.exec( "INSERT INTO dimcustomers (id, creation_date, business_name, full_user_name, email, number_elevators, city )
            # VALUES ('#{customer.created_at}', '#{customer.business_name}', '#{customer.contact_full_name}', '#{customer.contact_email}',  '#{nbElevator}', '#{customer.address.city}')")
        
            puts q.created_at
        end
    end
end
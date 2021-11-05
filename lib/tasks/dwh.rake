namespace :dwh do
    require 'pg'
        
    ActiveRecord::Base.establish_connection(
        { :adapter => 'mysql2',
          :database => 'Rocket_Elevators_Information_System_development',
          :host => 'localhost',
          :username => 'root',
          :password => "sgejzt23" }
       )
       
    task :create_table do
        # Output a table of current connections to the DB
        conn = PG.connect( dbname: 'data_warehouse', user: 'postgres' )
        conn.exec( "
            CREATE TABLE FactQuotes (
                id INT PRIMARY KEY,
                created_at varchar(50),
                company_name varchar(50),
                email varchar(100),
                nb_elevators int);
                CREATE TABLE FactContact (
                id INT PRIMARY KEY,
                created_at varchar(50),
                company_name varchar(50),
                email varchar(100),
                project_name varchar(50));
                CREATE TABLE FactElevator (
                id INT PRIMARY KEY,
                serial_number varchar(100),
                date_of_commissioning varchar(50),
                building_id int,
                customer_id int,
                building_city varchar(75));
                CREATE TABLE DimCustomers (
                id INT PRIMARY KEY,
                created_at varchar(50),
                company_name varchar(50),
                full_name_of_the_compagny_contact varchar (100),
                email_of_the_compagny_contact varchar(50),
                nb_elevators int,
                customers_city varchar(75));")
    end
    task fill_tables: :environment do
        #     old_quotes = []
        # Quote.all.each { |quote| old_quotes << quote }
        # puts old_quotes[1].total_price
        conn = PG.connect( dbname: 'data_warehouse', user: 'postgres' )
        
        #QuoteFact
        @quotes = Quote.all
        @leads = Lead.all
        @elevators = Elevator.all
        @columns = Column.all
        @batteries = Battery.all
        @buildings = Building.all
        @customers = Customer.all
        @quotes.each do |q|
            conn.exec( "INSERT INTO FactQuotes (id, created_at, company_name, email, nb_elevators ) VALUES (#{q.id}, '#{q.created_at}', '#{q.company_name}', '#{q.email}', #{q.elevator_needed});" )
            puts q.created_at
        end
        #FactContact
        @leads.each do |l|
            conn.exec( "INSERT INTO FactContact (id, created_at, company_name, email, project_name ) VALUES (#{l.id}, '#{l.created_at}', '#{l.company_name}', '#{l.email}', '#{l.project_name}');" )
            puts l.created_at
        end
        #factElevator
        @elevators.each do |e|
            conn.exec( "INSERT INTO FactElevator (id, serial_number, date_of_commissioning, building_id, customer_id, building_city) VALUES (#{e.id}, '#{e.serial_number}', '#{e.date_of_commissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{"quebec"}');" )
            puts e.created_at
        end
        #DimCustomer
        @customers.each do |c|
            numberOfElevator = 0

            c.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        column.elevators.all.each do |elevator|
                            
                            numberOfElevator += 1
                            puts "This is elevator: #{elevator.id}, count is #{numberOfElevator}."
                        end
                    end
                end
            end
            conn.exec( "INSERT INTO dimcustomers (id, created_at, company_name, full_name_of_the_compagny_contact, email_of_the_compagny_contact, nb_elevators, customers_city ) VALUES (#{c.id}, '#{c.created_at}', '#{c.company_name}', '#{c.full_name_of_the_compagny_contact}', '#{c.email_of_the_compagny_contact}', '#{numberOfElevator}', '#{"quebec"}');" )
            puts c.created_at 
        end
    end 
end
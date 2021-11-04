namespace :dwh do
    require 'pg'
    task :create_tables do
        puts "prout"
        
        # Creates table to the current connection
        conn = PG.connect( dbname: 'data_warehouse', user: "postgres" )
        conn.exec("
        CREATE TABLE FactQuotes (
        PersonID int,
        creation_date varchar(50),
        company_name varchar(50),
        email varchar(100),
        nb_elevators int);
        CREATE TABLE FactContact (
        creation_date varchar(1),
        company_name varchar(50),
        email varchar(100),
        project_name varchar(50));
        CREATE TABLE FactElevator (
        serial_number varchar(100),
        date_of_commissioning varchar(1),
        building_id int,
        customer_id int,
        building_city varchar(75));
        CREATE TABLE DimCustomers (
        creation_date varchar(1),
        company_name varchar(50),
        full_name_of_the_companys_main_contact varchar (100),
        email_of_the_companys_main_contact varchar(1),
        nb_elevators int,
        customers_city varchar(75));")
    end

    task :fill_tables do
        @quotes = Quote.all
        @quotes.each do |q|
        puts q
        end
    end
end
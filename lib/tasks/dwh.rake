namespace :dwh do
    require 'pg'
    require 'faker'
    require 'securerandom'
@interventionID = 1
               
    task :create_table do
        # Output a table of current connections to the DB 
        conn = PG.connect( dbname: 'data_warehouse', user: 'postgres' )
        conn.exec( "
            CREATE TABLE FactQuotes (
                id INT PRIMARY KEY,
                created_at varchar(100),
                company_name varchar(100),
                email varchar(100),
                nb_elevators int);
                CREATE TABLE FactContact (
                id INT PRIMARY KEY,
                created_at varchar(100),
                company_name varchar(100),
                email varchar(100),
                project_name varchar(100));
                CREATE TABLE FactElevator (
                id INT PRIMARY KEY,
                serial_number varchar(100),
                date_of_commissioning varchar(100),
                building_id int,
                customer_id int,
                building_city varchar(75));
                CREATE TABLE DimCustomers (
                id INT PRIMARY KEY,
                created_at varchar(100),
                company_name varchar(100),
                full_name_of_the_company_contact varchar (100),
                email_of_the_company_contact varchar(100),
                nb_elevators int,
                customers_city varchar(75));
                CREATE TABLE FACTIntervention (
                id INT PRIMARY KEY,
                employee_ID int,
                building_id int,
                battery_id int,
                column_id int,
                elevator_id int,
                intervention_start varchar,
                intervention_end varchar,
                result varchar(100),
                report varchar(100),
                status varchar(100));")
    end
    task fill_tables: :environment do
        conn = PG.connect( dbname: 'data_warehouse', user: 'postgres' )
        
        #QuoteFact
        @employees = Employee.all  
        @quotes = Quote.all
        @leads = Lead.all
        @elevators = Elevator.all
        @columns = Column.all
        @batteries = Battery.all
        @buildings = Building.all
        @customers = Customer.all
        @quotes.each do |q|
            conn.exec( "INSERT INTO FactQuotes (id, created_at, company_name, email, nb_elevators ) VALUES (#{q.id}, '#{q.created_at}', '#{q.company_name}', '#{q.email}', #{q.elevator_needed});" )
        end
        #FactContact
        @leads.each do |l|
            conn.exec( "INSERT INTO FactContact (id, created_at, company_name, email, project_name ) VALUES (#{l.id}, '#{l.created_at}', '#{l.company_name}', '#{l.email}', '#{l.project_name}');" )
        end
        #factElevator
        @elevators.each do |e|
            conn.exec( "INSERT INTO FactElevator (id, serial_number, date_of_commissioning, building_id, customer_id, building_city) VALUES (#{e.id}, '#{e.serial_number}', '#{e.date_of_commissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{"quebec"}');" )
        end
        #DimCustomer
        @customers.each do |c|
            numberOfElevator = 0
            c.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        column.elevators.all.each do |elevator|
                            
                            numberOfElevator += 1
                        end
                    end
                end
            end
            conn.exec( "INSERT INTO dimcustomers (id, created_at, company_name, full_name_of_the_company_contact, email_of_the_company_contact, nb_elevators, customers_city ) VALUES (#{c.id}, '#{c.created_at}', '#{c.company_name}', '#{c.full_name_of_the_company_contact}', '#{c.email_of_the_company_contact}', '#{numberOfElevator}', '#{"quebec"}');" )
        end
    #FactIntervention
    @interventionID = 0
    50.times do 
        buildingId = nil
        batteryId = nil
        columnId = nil
        elevatorId = nil
        isBatteryNull = ["battery_id, ", nil].sample
        isColumnNull = ["column_id, ", nil].sample
        isElevatorNull = ["elevator_id, ", nil].sample
        isInterventionEnd = "intervention_end"
        virgule = [", ", ", ", ", ", ", "]
        # Get the correct Id for the appropriate buildings
        @buildings.all.each do |building|
            buildingId = building.id
            puts(buildingId)
            building.batteries.all.each do |battery|
                batteryId = battery.id
                if isBatteryNull.nil?
                    batteryId = nil
                    virgule[0] = ""
                end
                puts(batteryId)
                battery.columns.all.each do |column|
                    columnId = column.id
                    if isColumnNull.nil?
                        columnId = nil
                        virgule[1] = ""
                    end
                    puts(columnId)
                    column.elevators.all.each do |elevator|
                        elevatorId = elevator.id
                        if isElevatorNull.nil?
                            elevatorId = nil
                            virgule[2] = ""
                        end
                        puts(elevatorId)
                    end
                end
            end
        
            #Fake the data in the FactIntervention
            employeeId = SecureRandom.random_number(1..@employees.length())
            startDate = Faker::Time.between(from: '2018-01-1', to: '2021-11-25', format: :long)
            puts (startDate)
            endDate = Faker::Time.between(from: startDate, to: '2021-11-25', format: :long)
            resultVar = ["Success", "Failure", "Incompleted"].sample
            # Depending on which result is choosen randomly put the statusVar and reportVar to something that matches 
            if resultVar == "Success"
                statusVar = "Complete"
                reportVar = "Wow we did it yeah!"
            elsif resultVar == "Failure"
                statusVar = ["Pending", "Interrupted"].sample
                reportVar = "not good report"
            else statusVar == "Incomplete"
                statusVar = ["InProgres", "Resumed"].sample
                reportVar = "we are bad"
                endDate = nil
                virgule[3] = ""
                isInterventionEnd = ""
            end
            @interventionID += 1
            #Push the value inside the database id, employeeId, buildingId, batteryId, columnId, elevatorId, startDate,endDate, resultVar, reportVar, statusVar
            conn.exec( "INSERT INTO FactIntervention
                (id ,employee_id, building_id, #{isBatteryNull}#{isColumnNull}#{isElevatorNull}intervention_start, #{isInterventionEnd}#{virgule[3]} result, report, status ) 
                VALUES (#{@interventionID},'#{employeeId}', #{buildingId} #{virgule[0]} #{batteryId} #{virgule[1]} #{columnId} #{virgule[2]} #{elevatorId} ,'#{startDate}','#{endDate}'#{virgule[3]} 
                '#{resultVar}', '#{reportVar}', '#{statusVar}');" )
            end
        end
    end
end 
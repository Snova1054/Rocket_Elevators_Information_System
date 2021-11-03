namespace :dwh do
    require 'pg'

    desc "populate the db with 10 people."
    task populate:  :environment do
        Person.destroy_all
        10.times do 
            Person.create!(
                name: "AJ"
                
                
                
            )
        end
    end


    task :postgres do
        puts "test"

        # Output a table of current connections to the DB
        conn = PG.connect( dbname: 'Rocket_Elevators_Information_System_development', user: "marcalexandreperussecavanagh" )
        conn.exec()

        CREATE TABLE 



        puts "-----------------"
        puts conn
        puts "-----------------"

        Quote.each do |q|
            puts q
        end
        
        # conn.exec( "SELECT * FROM pg_stat_activity" ) do |result|
        #     puts "     PID | User             | Query"
        
        #     puts result
        #     result.each do |row|
        #         puts " %7d | %-16s | %s " %
        #         row.values_at('pid', 'usename', 'query')
        #     end
        # end

    
    end
    task :create_table do
        puts "test"

        # Output a table of current connections to the DB
        conn = PG.connect( dbname: 'Rocket_Elevators_Information_System_development', user: "marcalexandreperussecavanagh" )
        conn.exec( "CREATE TABLE fact_quotes" )

        
        
        # conn.exec( "SELECT * FROM pg_stat_activity" ) do |result|
        #     puts "     PID | User             | Query"
        
        #     puts result
        #     result.each do |row|
        #         puts " %7d | %-16s | %s " %
        #         row.values_at('pid', 'usename', 'query')
        #     end
        # end
    end
end


# # Output a table of current connections to the DB
# conn = PG.connect( dbname: 'sales' )
# conn.exec( "SELECT * FROM pg_stat_activity" ) do |result|
#   puts "     PID | User             | Query"
#   result.each do |row|
#     puts " %7d | %-16s | %s " %
#       row.values_at('pid', 'usename', 'query')
#   end
# end
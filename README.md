# README
## Welcome guys

to connect as an admin use the email: nicolas.genest@codeboxx.biz and password: Codeboxx1

to connect as an employee use the email of any codeboxx employee and password: Codeboxx1

only admin and employee can access the backoffice

To create the database in MySQL you need to do this command in WSL.
`rails db:create db:migrate db:seed`
And to create the PostgreSQL you need to do this command in WSL
`rails dwh:create_table`
`rails dwh:fill_tables`

If you want to test our Queries you can use this command for the quote:
`   SELECT cast (extract(month from created_at)as varchar) as Month, count(id) as "Monthly leads"
     FROM factquotes
     GROUP BY Month 
     ORDER BY "Monthly leads";`

For the leads : 
`   SELECT cast (extract(month from created_at)as varchar) as Month, count(id) as "Monthly leads"
     FROM factcontact
     GROUP BY Month 
     ORDER BY "Monthly leads";`

For the elevator per customer :
`SELECT cast (customer_id as varchar) as "Customer ID", count(id) as "Elevator Count"
            FROM factelevator
            GROUP BY customer_id
            ORDER BY COUNT(id) DESC;`
            

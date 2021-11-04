# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# userxx = User.create!(email: '', password: 'Codeboxx1') # model
# employee = Employee.create(last_name: '', first_name: '', title: '', user: user) # model
require 'faker'
require 'securerandom'



20.times do

    Faker::Config.locale = 'en-CA'
    compagnyName = Faker::Company.name
    managerName = Faker::Name.name
    compagnyContact = Faker::Name.name
    contactEmail = Faker::Internet.email(name: compagnyContact, domain: compagnyName)
    managerEmail = Faker::Internet.email(name: managerName, domain: compagnyName)

    #User
    user = User.create!(
        email: managerEmail,
        password: 'Codeboxx1'
    )
    
    #Customer
    customer = Customer.create!(
        company_name: Faker::Company.name,
        compagny_headquarters_adress: Faker::Address.full_address,
        full_name_of_the_compagny_contact: compagnyContact,
        compagny_contact_phone: Faker::PhoneNumber.cell_phone,
        email_of_the_compagny_contact: contactEmail,
        compagny_description: Faker::Company.industry,
        full_name_of_service_technical_authority: Faker::Name.name,
        technical_authority_phone_for_service: Faker::PhoneNumber.cell_phone,
        technical_manager_email_for_service: managerEmail,
        user: user
    )

    #Building
    nameAdminBuilding =  Faker::Name.name
    nameTecnicalContact = Faker::Name.name
    building = Building.create!(
        full_name_of_the_building_administrator: nameAdminBuilding,
        email_of_the_administrator_of_the_building: Faker::Internet.email(name: nameAdminBuilding, domain: compagnyName),
        phone_number_of_the_building_administrator: Faker::PhoneNumber.cell_phone,
        full_name_of_the_technical_contact_for_the_building: nameTecnicalContact,
        technical_contact_email_for_the_building: Faker::Internet.email(name: nameTecnicalContact, domain: compagnyName),
        technical_contact_phone_for_the_building: Faker::PhoneNumber.cell_phone,
        customer: customer
    )

    #Battery
    entityType = ["Residential", "Corporate", "Other"].sample
    dateCreated = Faker::Time.between(from: '2018-01-1', to: '2021-11-25')
    battery = Battery.create!(
    entity_type: entityType,
    status: "Active",
    date_of_commissioning: Faker::Time.between(from: '2018-01-1', to: '2021-11-25'),
    date_of_last_inspection: Faker::Time.between(from: dateCreated, to: '2021-11-25'),
    certificate_of_operations: Faker::Number.between(from: 1, to: 5),
    information: "", #Add more informations 
    notes: Faker::Quote.yoda, #Add real notes later
    building: building
    )

    #Column
    howManyColumn = SecureRandom.random_number(1..3)
    howManyColumn.times do 

        column = Column.create!(
            #(Residential,Commercial,Corporate) | ask for hybrid
            number_of_floors_served: SecureRandom.random_number(2..30),
            entity_type: entityType,
            status: "Online",
            information: "",
            notes: Faker::Quote.yoda,
            battery: battery
        )
    
            #Elevator
        howManyElevator = SecureRandom.random_number(1..5)
        howManyElevator.times do
            model = ["Standard", "Premium", "Excelium"].sample
            elevator = Elevator.create!(
                serial_number: Faker::Number.leading_zero_number(digits: 6),
                model: model,
                entity_type: entityType,
                status: "Idle",
                date_of_commissioning: dateCreated,
                date_of_last_inspection: Faker::Time.between(from: dateCreated, to: '2021-11-25'),
                certificate_of_inspection: "HELLO WORLD", #check with david
                information: "",
                Notes: Faker::Quote.yoda,
                column: column
            )
        end
    end
end
#Create the fake Leads
20.times do
    randomDate = Faker::Time.between(from: '2018-01-1', to: '2021-11-25')
    full_name = Faker::Name.name
    lead = Lead.create!(
        full_name: full_name,
        compagny_name: Faker::Company.name,
        email: Faker::Internet.email(name: full_name),
        phone_number: Faker::PhoneNumber.cell_phone,
        project_name: Faker::Company.industry,
        project_description: Faker::IndustrySegments.sector,
        departement_in_charge_of_the_elevators: ["Residential", "Corporate", "Other"].sample,
        message: Faker::Hipster.sentences,
        created_at: randomDate,
        updated_at: randomDate

    )
    
end

#Create the fake Quotes
20.times do
    # Declares and sets variables
    ### IF ACTIVITY HOURS ARE SET IN THE DATABASE AND EVERYWHERE ELSE
    ### THEN UNCOMMENT LINE 29, 52, 53, 54, 75 AND ADD A COMMA (,)
    ### AT THE END OF THE LINE 74
    randomDate = Faker::Time.between(from: '2018-01-1', to: '2021-11-25')
    appartments = 0.0
    floors = SecureRandom.random_number(1..100) + 1.0
    basements = SecureRandom.random_number(0..20)
    business = SecureRandom.random_number(1..250)
    parkings = SecureRandom.random_number(1..1000)
    occupantsPerFloorNum = 0.0
    activity_hours = 0
    building_type = ["Residential", "Commercial", "Corporate", "Hybrid"].sample
    plan_choice = SecureRandom.random_number(0..2)
    plan_title = ["Standard", "Premium", "Excelium"]
    plan_price = [7565, 12345, 15400]
    fees = [1.1, 1.13, 1.16]
    #activity_hours = 0
    
    # Calculates the total price according to data
    if building_type == "Residential"
        appartments = SecureRandom.random_number(1..500)
        averageDoorsPerFloor = (appartments/floors).ceil()
        elevatorsPerColumn = (averageDoorsPerFloor/6.0).ceil()
        columns = (floors/20.0).ceil()
        @totalElevators = columns * elevatorsPerColumn
        business = 0
        parkings = 0
    elsif building_type == "Commercial"
        @totalElevators = SecureRandom.random_number(1..10)
    elsif building_type == "Corporate" || building_type == "Hybrid"  
        occupantsPerFloorNum = SecureRandom.random_number(1..500)
        occupants = occupantsPerFloorNum * (floors + basements)
        elevators = (occupants / 1000.0).truncate()
        if elevators == 0
            elevators += 1
        end
        columns = ((floors + basements) / 20.0).ceil()
        elevatorsPerColumn = (elevators * 1.0 / columns).ceil()
        @totalElevators = elevatorsPerColumn * columns
        # if building_type == "Hybrid"
        #     activity_hours = SecureRandom.random_number(1..24)
        # end
    end
    priceNoFees = @totalElevators * plan_price[plan_choice]
    total_price = (@totalElevators * plan_price[plan_choice] * fees[plan_choice])
    
    # Creates the quote with according to the data
    quote = Quote.create!(
        building_type: building_type,
        appartement: appartments,
        floor: floors,
        basement: basements,
        plan: plan_title[plan_choice],
        business: business,
        parking: parkings,
        cages: @totalElevators,
        occupant: occupantsPerFloorNum,
        elevatorNeeded: @totalElevators,
        price: ('%.2f' %priceNoFees),
        fees: ('%.2f' %fees[plan_choice]),
        totalPrice: ('%.2f' %total_price),
        created_at: randomDate,
        updated_at: randomDate
        #activityHours: activity_hours
    )
end


user = User.create!(email: 'nicolas.genest@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create!(last_name: "Genest", first_name: "Nicolas", title: "CEO", user: user)

user1 = User.create!(email: 'nadya.fortier@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Nadya', first_name: 'Fortier', title: 'Director', user: user)

user2 = User.create!(email: 'martin.chantal@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Chantal', first_name: 'Martin', title: 'Assistant Director', user: user)

user4 = User.create!(email: 'mathieu.houde@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create!(last_name: "Houde", first_name: "Mathieu", title: "Captain", user: user)

user5 = User.create!(email: 'mpatrick.thibault@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Thibeault', first_name: 'Patrick', title: 'Captain', user: user)

user6 = User.create!(email: 'david.boutin@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Goutin', first_name: 'David', title: 'Engineer', user: user)

user7 = User.create!(email: 'mathieu.lortie@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Lortie', first_name: 'Mathieu', title: 'Engineer', user: user)

user8 = User.create!(email: 'thomas.carrier@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Carrier', first_name: 'Thomas', title: 'Engineer', user: user)

user9 = User.create!(email: 'serge.savoie@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Savoie', first_name: 'Serge', title: 'Engineer', user: user)

user11 = User.create!(email: 'francis.patry-jessop@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Patry-Jessop', first_name: 'Francis', title: 'Engineer', user: user)

user12 = User.create!(email: 'mathieu.lefrancois@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Lefrancois', first_name: 'Mathieu', title: 'Engineer', user: user)

user13 = User.create!(email: 'david.larochelle@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Larochelle', first_name: 'David', title: 'Engineer', user: user)

user14 = User.create!(email: 'nicolas.pineault@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Pineault', first_name: 'Nicolas', title: 'Engineer', user: user)

user15 = User.create!(email: 'david.amyot@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Amyot', first_name: 'David', title: 'Engineer', user: user)

user16 = User.create!(email: 'remi.gagnon@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Gagnon', first_name: 'Remi', title: 'Engineer', user: user)

user17 = User.create!(email: 'timothy.wever@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Wever', first_name: 'Timothy', title: 'Developper', user: user)

user18 = User.create!(email: 'kiril.kleinerman@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Kleinerman', first_name: 'Kiril', title: 'Developper', user: user)

user19 = User.create!(email: 'emmanuela.derilus@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Derilus', first_name: 'Emmanuela', title: 'Developper', user: user)

user20 = User.create!(email: 'abdul.akeeb@codebozz.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Akeeb', first_name: 'Abdul', title: 'Developper', user: user)

user21 = User.create!(email: 'krista.sheely@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Sheely', first_name: 'Krista', title: 'Developper', user: user)

user22 = User.create!(email: 'jonathan.murray@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create(last_name: 'Murray', first_name: 'Jonathan', title: 'Developper', user: user)


















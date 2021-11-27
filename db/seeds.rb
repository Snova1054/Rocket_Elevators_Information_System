require 'zendesk_main'
require 'faker'
require 'securerandom'
require 'json'
user = User.create!(email: 'nicolas.genest@codeboxx.biz', password: 'Codeboxx1', admin: true, client: false)
employee = Employee.create!(last_name: "Genest", first_name: "Nicolas", title: "CEO", user: user)
user = User.create!(email: 'nadya.fortier@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Nadya', first_name: 'Fortier', title: 'Director', user: user)
user = User.create!(email: 'martin.chantal@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Chantal', first_name: 'Martin', title: 'Assistant Director', user: user)
user = User.create!(email: 'mathieu.houde@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create!(last_name: "Houde", first_name: "Mathieu", title: "Captain", user: user)
user = User.create!(email: 'mpatrick.thibault@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Thibeault', first_name: 'Patrick', title: 'Captain', user: user)
user = User.create!(email: 'david.boutin@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Goutin', first_name: 'David', title: 'Engineer', user: user)
user = User.create!(email: 'mathieu.lortie@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Lortie', first_name: 'Mathieu', title: 'Engineer', user: user)
user = User.create!(email: 'thomas.carrier@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Carrier', first_name: 'Thomas', title: 'Engineer', user: user)
user = User.create!(email: 'serge.savoie@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Savoie', first_name: 'Serge', title: 'Engineer', user: user)
user = User.create!(email: 'francis.patry-jessop@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Patry-Jessop', first_name: 'Francis', title: 'Engineer', user: user)
user = User.create!(email: 'mathieu.lefrancois@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Lefrancois', first_name: 'Mathieu', title: 'Engineer', user: user)
user = User.create!(email: 'david.larochelle@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Larochelle', first_name: 'David', title: 'Engineer', user: user)
user = User.create!(email: 'nicolas.pineault@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Pineault', first_name: 'Nicolas', title: 'Engineer', user: user)
user = User.create!(email: 'david.amyot@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Amyot', first_name: 'David', title: 'Engineer', user: user)
user = User.create!(email: 'remi.gagnon@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Gagnon', first_name: 'Remi', title: 'Engineer', user: user)
user = User.create!(email: 'timothy.wever@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Wever', first_name: 'Timothy', title: 'Developper', user: user)
user = User.create!(email: 'kiril.kleinerman@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Kleinerman', first_name: 'Kiril', title: 'Developper', user: user)
user = User.create!(email: 'emmanuela.derilus@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Derilus', first_name: 'Emmanuela', title: 'Developper', user: user)
user = User.create!(email: 'abdul.akeeb@codebozz.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Akeeb', first_name: 'Abdul', title: 'Developper', user: user)
user = User.create!(email: 'krista.sheely@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Sheely', first_name: 'Krista', title: 'Developper', user: user)
user = User.create!(email: 'jonathan.murray@codeboxx.biz', password: 'Codeboxx1', employee: true, client: false)
employee = Employee.create(last_name: 'Murray', first_name: 'Jonathan', title: 'Developper', user: user)

# # Reading the random real address json file
file = File.read("./rrad/addresses-us-all.json")
data_hash = JSON.parse(file)
address = data_hash["addresses"].shuffle
index = 0
$reusableEmails = []
i = 0

while i < 10 do
    Faker::Config.locale = 'en-CA'
    managerName = Faker::Name.name.gsub(/\W/, ' ')
    companyName = Faker::Company.name.gsub(/\W/, ' ')
    companyContact = Faker::Name.name.gsub(/\W/, ' ')
    $reusableEmails.append(Faker::Internet.email(name: companyContact, domain: companyName))
    managerEmail = Faker::Internet.email(name: managerName, domain: companyName)
    coordinates = address[index]["coordinates"]
    
    #User
    user = User.create!(
        email: managerEmail,
        password: 'Codeboxx1'
    )
    customerAddress = Address.create!(
        address: ["Residential", "Corporate", "Commercial", "Hybrid"].sample,
        status: ["Rented", "Sold", "For sale"].sample,
        entity: "Other",
        number_and_street: address[index]["address1"],
        suite_or_apartment: ["suite", "apartment"].sample,
        city: address[index]["city"],
        postal_code: address[index]["postalCode"],
        country: "USA",
        lat: coordinates["lat"],
        lng: coordinates["lng"],
        notes: Faker::Lorem.paragraph
    )
    
    #Customer
    customer = Customer.create!(
        company_name: Faker::Company.name.gsub(/\W/, ' '),
        full_name_of_the_company_contact: companyContact,
        company_contact_phone: Faker::PhoneNumber.cell_phone,
        email_of_the_company_contact: $reusableEmails[i],
        company_description: Faker::Company.industry,
        full_name_of_service_technical_authority: Faker::Name.name.gsub(/\W/, ' ') ,
        technical_authority_phone_for_service: Faker::PhoneNumber.cell_phone,
        technical_manager_email_for_service: managerEmail,
        user: user,
        address: customerAddress
    )

    index += 1
    
    #Building
    howManyBuilding = SecureRandom.random_number(1..10)
    howManyBuilding.times do
        entityType = ["Residential", "Corporate", "Other"].sample
        architecture = ["Doric", "Ionic", "Corinthian"].sample
        howManyColumn = SecureRandom.random_number(1..3)
        floor = SecureRandom.random_number(2..30)
        totalFloor = floor * howManyColumn
        index += 1
        coordinates = address[index]["coordinates"]
        buildingAddress = Address.create!(
            address: ["Residential", "Corporate", "Commercial", "Hybrid"].sample,
            status: ["Rented", "Sold", "For sale"].sample,
            entity: "Other",
            number_and_street: address[index]["address1"],
            suite_or_apartment: ["suite", "apartment"].sample,
            city: address[index]["city"],
            postal_code: address[index]["postalCode"],
            country: "USA",
            lat: coordinates["lat"],
            lng: coordinates["lng"],
            notes: Faker::Lorem.paragraph
        )
        nameAdminBuilding =  Faker::Name.name.gsub(/\W/, ' ')
        nameTecnicalContact = Faker::Name.name.gsub(/\W/, ' ')
        building = Building.create!(
            full_name_of_the_building_administrator: nameAdminBuilding,
            email_of_the_administrator_of_the_building: Faker::Internet.email(name: nameAdminBuilding, domain: companyName),
            phone_number_of_the_building_administrator: Faker::PhoneNumber.cell_phone,
            full_name_of_the_technical_contact_for_the_building: nameTecnicalContact,
            technical_contact_email_for_the_building: Faker::Internet.email(name: nameTecnicalContact, domain: companyName),
            technical_contact_phone_for_the_building: Faker::PhoneNumber.cell_phone,
            customer: customer,
            address: buildingAddress
        )
        buildingDetail = BuildingDetail.create!(
            informations_key: "type , construction_year, architecture, number_of_floors, maximum_number_of_occupant",
            value: "#{entityType}, #{SecureRandom.random_number(1960..2021)}, #{architecture}, #{totalFloor}, #{SecureRandom.random_number(10..1500000)}",
            building: building

        ) 
        #Battery
        dateCreated = Faker::Time.between(from: '2018-01-1', to: '2021-11-25')
        battery = Battery.create!(
            entity_type: entityType,
            status: ["active", "intervention", "inactive"].sample,
            date_of_commissioning: Faker::Time.between(from: '2018-01-1', to: '2021-11-25'),
            date_of_last_inspection: Faker::Time.between(from: dateCreated, to: '2021-11-25'),
            certificate_of_operations: Faker::Number.between(from: 1, to: 5),
            information: "", #Add more informations 
            notes: Faker::Lorem.paragraph, 
            building: building
        )
        #Column
        howManyColumn.times do 
            column = Column.create!(
                #(Residential,Commercial,Corporate) | ask for hybrid
                number_of_floors_served: floor,
                entity_type: entityType,
                status: ["online", "intervention", "offline"].sample,
                information: "",
                notes: Faker::Lorem.paragraph,
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
                    status: ["running", "serviced", "intervention", "offline"].sample,
                    date_of_commissioning: dateCreated,
                    date_of_last_inspection: Faker::Time.between(from: dateCreated, to: '2021-11-25'),
                    certificate_of_inspection: "HELLO WORLD", #check with david
                    information: howManyElevator,
                    Notes: Faker::Hacker.say_something_smart,
                    column: column
                )
            end 
        end     
    end
    i += 1
end
    #Create the fake Leads
    40.times do
        randomDate = Faker::Time.between(from: '2018-11-28', to: '2021-11-28')
        full_name = Faker::Name.name.gsub(/\W/, ' ') 
        lead = Lead.create!(
            full_name: full_name,
            company_name: Faker::Company.name.gsub(/\W/, ' '),
            email: [$reusableEmails.sample, Faker::Internet.email(name: full_name), Faker::Internet.email(name: full_name), Faker::Internet.email(name: full_name)].sample,
            phone_number: Faker::PhoneNumber.cell_phone,
            project_name: Faker::Company.industry,
            project_description: Faker::IndustrySegments.sector,
            departement_in_charge_of_the_elevators: ["Residential", "Corporate", "Other"].sample,
            message: Faker::Hacker.say_something_smart,
            created_at: randomDate,
            updated_at: randomDate
        )
        
    end
#Create the fake Quotes
50.times do
    randomDate = Faker::Time.between(from: '2018-11-28', to: '2021-11-28')
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
    end
    priceNoFees = @totalElevators * plan_price[plan_choice]
    total_price = (@totalElevators * plan_price[plan_choice] * fees[plan_choice])
    
    # Creates the quote with according to the data
    quote = Quote.create!(
        email: Faker::Internet.email,
        company_name: Faker::Company.name.gsub(/\W/, ' '),
        building_type: building_type,
        appartement: appartments,
        floor: floors,
        basement: basements,
        plan: plan_title[plan_choice],
        business: business,
        parking: parkings,
        cages: @totalElevators,
        occupant: occupantsPerFloorNum,
        elevator_needed: @totalElevators,
        price: ('%.2f' %priceNoFees),
        fees: ('%.2f' %fees[plan_choice]),
        total_price: ('%.2f' %total_price),
        created_at: randomDate,
        updated_at: randomDate
    )
end

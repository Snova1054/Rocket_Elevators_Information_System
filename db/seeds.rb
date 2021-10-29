# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# employee table
# employee = Employees.create([{user_id: 0 }, {last_name: ''}, {first_name:''}, {title: ''}])
user = User.create!(email: 'nicolas.genest@codeboxx.biz', password: 'Codeboxx1')
employee = Employee.create!(last_name: "patate", first_name: "test", title: "test", user: user)

user1 = User.create!(email: 'nadya.fortier@codeboxx.biz', password: 'Codeboxx1!')
employee = Employee.create!(last_name: "patate", first_name: "test", title: "test", user: user1)

# user2 = User.create!(email: '133456@ok.com', password: 'Codeboxx1!')
# employee = Employee.create!(last_name: "patate", first_name: "test", title: "test", user: user)

# user = User.create!(email: '133456@ok.com', password: 'Codeboxx1!')
# employee = Employee.create!(last_name: "patate", first_name: "test", title: "test", user: user)

puts "--------------------"
puts user.email
puts employee.user
puts "--------------------"

# user1 = User.create!(email: '', password: 'Codeboxx1')
# # Employee.create(user: user, last_name: 'Nadya', first_name: 'Fortier', title: 'Director')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Chantal', first_name: 'Martin', title: 'Assistant Director')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Houde', first_name: 'Mathieu', title: 'Captain')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Thibeault', first_name: 'Patrick', title: 'Captain')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Goutin', first_name: 'David', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Lortie', first_name: 'Mathieu', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user 8, last_name: 'Carrier', first_name: 'Thomas', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Savoie', first_name: 'Serge', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user 10, last_name: 'Patry-Jessop', first_name: 'Francis', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(use: user, last_name: 'Lefrancois', first_name: 'Mathieu', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Larochelle', first_name: 'David', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Pineault', first_name: 'Nicolas', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Amyot', first_name: 'David', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Gagnon', first_name: 'Remi', title: 'Engineer')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Wever', first_name: 'Timothy', title: 'Developper')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Kleinerman', first_name: 'Kiril', title: 'Developper')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Derilus', first_name: 'Emmanuela', title: 'Developper')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Akeeb', first_name: 'Abdul', title: 'Developper')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Sheely', first_name: 'Krista', title: 'Developper')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'Murray', first_name: 'Jonathan', title: 'Developper')

# let user = User.create([{user_id:0}])
# Employee.create(user: user, last_name: 'marc', first_name: 'marc', title: 'Developper')




# Employee.create(user_id: , last_name: '', first_name, '', title: '') # use this model for add a new employee













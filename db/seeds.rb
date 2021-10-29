# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# userxx = User.create!(email: '', password: 'Codeboxx1') # model
# employee = Employee.create(last_name: '', first_name: '', title: '', user: user) # model

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
employee = Employee.create(user: user, last_name: 'Savoie', first_name: 'Serge', title: 'Engineer', user: user)

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


















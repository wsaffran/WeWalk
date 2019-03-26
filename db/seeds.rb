  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "Will", password_digest: "password", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: 1996-07-10, token_balance: 0)
user2 = User.create(name: "Admin", password_digest: "admin", address: "99 Chicken Ct", city: "Smith Town", state: "NY", zip_code: 11801, dob: 1993-02-22, token_balance: 0)

dog1 = Dog.create(name: "Mochi", breed: "poodle", age: 7, hypo_allergenic: true, care_info: "none", user_id: 1)

appointment1 = Appointment.create(walker_id: 2, dog_id: 1, appointment_date: 2019-03-25, appointment_time: "9:00", walk_duration: 30, notes: "none")

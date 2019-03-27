  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(first_name: "Will", last_name: "will", username: "Admin", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.today)
user2 = User.create(first_name: "John", last_name: "John", username: "john", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.today)

# appointment1 = Appointment.create(walker_id: 2, dog_id: 1, appointment_date: 2019-03-25, appointment_time: "9:00", walk_duration: 30, notes: "none")


user1 = User.create(username: "will", first_name: "Will", last_name: "Saffran", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user2 = User.create(username: "abbyparker", first_name: "Abby", last_name: "Parker", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user3 = User.create(username: "alexgibson", first_name: "Alex", last_name: "Gibson", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user4 = User.create(username: "fredbloggs", first_name: "Fred", last_name: "Bloggs", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user5 = User.create(username: "willynilly", first_name: "Willy", last_name: "Nilly", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user6 = User.create(username: "hillybillly", first_name: "Hilly", last_name: "Billy", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user7 = User.create(username: "saramills", first_name: "Sara", last_name: "Mills", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user8 = User.create(username: "gertrudemoonstone", first_name: "Gertrude", last_name: "Moonstone", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user9 = User.create(username: "jasperfitzwilliam", first_name: "Jasper", last_name: "Fitzwilliam", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))
user10 = User.create(username: "richie", first_name: "Richie", last_name: "Tam", password: "123456", address: "145 Turkey Ln", city: "CSH", state: "NY", zip_code: 11724, dob: Date.new(2007, 11, 10))

dog1 = Dog.create(image: "https://i.imgur.com/oT4qU.jpg", name: "8 ball", breed: "mut", age: 3, care_info: "none", user_id: 1)
dog2 = Dog.create(image: "https://i.imgur.com/KhYHiPY.jpg", name: "Aja", breed: "mut", age: 3, care_info: "none", user_id: 2)
dog3 = Dog.create(image: "https://i.imgur.com/3NEapy2.jpg", name: "Allyway", breed: "mut", age: 3, care_info: "none", user_id: 3)
dog4 = Dog.create(image: "https://i.imgur.com/prQXuAX.jpg", name: "Archie", breed: "mut", age: 3, care_info: "none", user_id: 4)
dog5 = Dog.create(image: "https://i.imgur.com/xov9tkl.jpg", name: "Aristotle", breed: "mut", age: 3, care_info: "none", user_id: 5)
dog6 = Dog.create(image: "https://i.imgur.com/8QQPv.jpg", name: "Aspirin", breed: "mut", age: 3, care_info: "none", user_id: 6)
dog7 = Dog.create(image: "https://i.imgur.com/caOfQ.jpg", name: "Astro", breed: "mut", age: 3, care_info: "none", user_id: 7)
dog8 = Dog.create(image: "https://i.imgur.com/Tlyk9.png", name: "Chad", breed: "mut", age: 3, care_info: "none", user_id: 8)
dog9 = Dog.create(image: "https://i.imgur.com/oqJCGvT.jpg", name: "Coder", breed: "mut", age: 3, care_info: "none", user_id: 9)
dog10 = Dog.create(image: "https://i.imgur.com/KhYHiPY.jpg", name: "Dash", breed: "mut", age: 3, care_info: "none", user_id: 10)
dog11 = Dog.create(image: "https://i.imgur.com/3NEapy2.jpg", name: "Marlin", breed: "mut", age: 3, care_info: "none", user_id: 10)
dog12 = Dog.create(image: "https://i.imgur.com/oqJCGvT.jpg", name: "Tyson", breed: "mut", age: 3, care_info: "none", user_id: 10)

100.times do
  Appointment.create(walker_id: rand(1..5), dog_id: rand(6..12), appointment_date: Date.new(2019, rand(1..12), rand(1..28)), walk_duration: [30, 60, 90].sample, notes: "none", status: ["scheduled", "complete"].sample, appointment_time: "09:00 AM", tokens: rand(1..3))
  Appointment.create(walker_id: rand(6..10), dog_id: rand(1..5), appointment_date: Date.new(2019, rand(1..12), rand(1..28)), walk_duration: [30, 60, 90].sample, notes: "none", status: ["scheduled", "complete"].sample, appointment_time: "09:00 AM", tokens: rand(1..3))
end

50.times do
  Appointment.create(walker_id: nil, dog_id: rand(1..12), appointment_date: Date.new(2019, rand(1..12), rand(1..28)), walk_duration: [30, 60, 90].sample, notes: "none", status: "open", appointment_time: "09:00 AM", tokens: rand(1..3))
end

10.times do
  Review.create(rating: rand(3..5), content: "great dogs!", reviewer_id: rand(1..5), reviewee_id: rand(6..10))
end

10.times do
  Review.create(rating: rand(3..5), content: "lovely!", reviewer_id: rand(1..5), reviewee_id: rand(6..10))
end

10.times do
  Review.create(rating: rand(4..5), content: "awesome!",reviewer_id: rand(6..10), reviewee_id: rand(1..5))
end

10.times do
  Review.create(rating: rand(4..5), content: "so sweet!",reviewer_id: rand(6..10), reviewee_id: rand(1..5))
end

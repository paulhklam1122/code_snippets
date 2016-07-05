["Ruby", "HTML", "CSS", "javascript"].each do |cat|
  Category.create name: cat
end

User.create(first_name: "Paul", last_name: "Lam", email: "paullam007@gmail.com", password: "p", is_admin: true)

User.create(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", password: "j")

User.create(first_name: "Tofu", last_name: "Tofu", email: "tofu@gmail.com", password: "t")

User.create(first_name: "Panda", last_name: "Panda", email: "panda@gmail.com", password: "p")

50.times do
  Snippet.create title: Faker::Lorem.word,
                work: Faker::Lorem.sentence,
                category_id: 1 + rand(4)
end

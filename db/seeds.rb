Group.destroy_all
20.times do
  Group.create!(title: Faker::Lorem.word, text: Faker::Lorem.paragraph(3))

end

Scientist.destroy_all
20.times do
  Scientist.create!(name: Faker::Name.name, text: Faker::Lorem.paragraph(3))
end

User.destroy_all
admin = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
admin.add_role "admin"
(1..3).each do |n|
  u = User.create!(email: "moderator#{n}@example.com", password: 'password', password_confirmation: 'password')
  Group.all.sample(5).each do |group|
    u.add_role "moderator", group
  end
  Scientist.all.sample(5).each do |scientist|
    u.add_role "moderator", scientist
  end
end
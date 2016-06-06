Branch.destroy_all
4.times do 
	Branch.create(title: Faker::Lorem.word)
end
puts "Root Branches created"

Branch.all.each do |branch| 
	3.times do 
		Branch.create(title: Faker::Lorem.word, 
									parent_id: branch.id)
	end
end
puts "Child Branches created"

Group.destroy_all
20.times do
  group = Group.create!(title: Faker::Lorem.word, 
  							text: Faker::Lorem.paragraph(3))
  group.branches = Branch.all.sample(3)
  group.save
end
puts "Groups created"

Scientist.destroy_all
20.times do
  scientist = Scientist.create!(name: Faker::Name.name, 
  									text: Faker::Lorem.paragraph(3))
	scientist.branches = Branch.all.sample(3)
	scientist.save
end
puts "Scientists created"

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
puts "Users created"

Connection.destroy_all
10.times do 
	Connection.create(title: Faker::Lorem.word, 
										branch_id: Branch.all.sample.id, 
										description: Faker::Lorem.paragraph(3))
end
puts "Connections created"
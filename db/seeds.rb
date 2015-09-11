def create_data
	create_users
end

def create_users
	pass = 'password'
	User.create(name: 'test', email: 'test@example.com', password: 'password')
	20.times do 
		name = Faker::Name.first_name + Faker::Name.last_name
		User.create(name: name.downcase, email: name.downcase + "@example.com", password: 'password')
	end
end

User.destroy_all
create_data
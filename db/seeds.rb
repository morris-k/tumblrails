require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

def create_data
	create_users
	create_follows
end

def create_users
	pass = 'password'
	User.create(name: 'test', email: 'test@example.com', password: 'password')
	20.times do 
		name = Faker::Name.first_name + Faker::Name.last_name
		User.create(name: name.downcase, email: name.downcase + "@example.com", password: 'password')
	end
end

def create_follows
	User.all.each do |u|
		tms = rand(10) + 5
		tms.times do
			us = rand(User.count) + 1
			ups = User.find(us).primary_blog
			if u.can_follow(ups)
				u.follow(ups)
			end
		end
	end
end

DatabaseCleaner.clean
create_data
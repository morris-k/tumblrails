require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

def create_data
	create_users
	create_follows
	create_posts
end

def create_users
	puts "CREATING USERS"
	pass = 'password'
	User.create(name: 'test', email: 'test@example.com', password: 'password')
	20.times do 
		name = Faker::Name.first_name + Faker::Name.last_name
		User.create(name: name.downcase, email: name.downcase + "@example.com", password: 'password')
	end
	puts "--- #{User.count} USERS CREATED"
end

def create_follows
	puts "CREATING FOLLOWS"
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
	puts "---FOLLOWS CREATED"
end

def create_posts
	puts "CREATING POSTS"
	s = Speak::Generator.new
	User.all.each do |u|
		tms = rand(5) + 1
		tms.times do |i|
			title = Faker::Lorem.sentence
			body = s.generate_sentence
			tag_list = Array.new(rand(5) + 1) { Faker::Commerce.color }.uniq.join(", ")
			t = Text.new(blog_id: u.primary_blog.id, title: title, body: body, tag_list: tag_list)
			t.save
			t.update(created_at: (rand(10)).days.ago)
		end
	end
	puts "--- #{Post.count} POSTS CREATED"
end

DatabaseCleaner.clean
create_data
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

def create_data
	create_users
	create_follows
	create_posts
	create_likes
end

def create_users
	ap = "/Applications/XAMPP/xamppfiles/htdocs/rails/tumblrails/app/assets/images/"
	ar_files = ["alien.jpeg", "animal.jpeg", "cop.jpeg", "penguin.jpeg", "racer.jpeg"].map{|x| ap + x }
	puts "CREATING USERS"
	pass = 'password'
	u = User.create(name: 'test', email: 'test@example.com', password: 'password')
	File.open(ap + "lights2.jpeg") do |f| 
		u.primary_blog.avatar = f
	end
	u.primary_blog.save
	20.times do |x|
		name = Faker::Name.first_name + Faker::Name.last_name
		u = User.create(name: name.downcase, email: name.downcase + "@example.com", password: 'password')
		avf = rand(ar_files.length)
		File.open(ar_files[avf]) do |f|
			u.primary_blog.avatar = f
		end
		u.primary_blog.save
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

def create_likes
	puts "CREATING LIKES"
	ids = [*1..21]
	Post.all.each do |p|
		n = rand(15) + 2
		ids.shuffle[0..n].each do |uid|
			User.find(uid).like(p)
		end
	end
	puts "--- #{Like.count} LIKES CREATED"
end

DatabaseCleaner.clean
create_data
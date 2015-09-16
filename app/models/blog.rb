class Blog < ActiveRecord::Base
	belongs_to :user

	mount_uploader :avatar, AvatarUploader

	has_many :passive_follows, foreign_key: :followed_id,
	        class_name: "BlogFollow"
	has_many :following_users, through: :passive_follows, source: :follower
	has_many :followers, through: :following_users, source: :primary_blog

	has_many :posts

	has_many :likes, foreign_key: :liked_id
	has_many :posts_liked, through: :likes, source: :post



	def reblog(post)
		
	end
end

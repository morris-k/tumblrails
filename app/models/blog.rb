class Blog < ActiveRecord::Base

	belongs_to :user

	has_many :blog_follows, foreign_key: :followed_id
	has_many :followers, through: :blog_follows, source: :follower
end

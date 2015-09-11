class Blog < ActiveRecord::Base

	belongs_to :user

	has_many :passive_follows, foreign_key: :followed_id,
                class_name: "BlogFollow"
  has_many :followers, through: :following_users, source: :primary_blog
  has_many :following_users, through: :passive_follows, source: :follower
end

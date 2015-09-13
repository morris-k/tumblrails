class Post < ActiveRecord::Base
	default_scope { order('created_at DESC') }

	acts_as_taggable

	belongs_to :blog

	def blog_name
		blog.name
	end

	def self.search_tags(tag)
		posts = Post.tagged_with(tag)
		puts posts
		posts
	end
end



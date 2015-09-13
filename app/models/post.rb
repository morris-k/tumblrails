class Post < ActiveRecord::Base
	default_scope { order('created_at DESC') }

	acts_as_taggable

	has_many :post_attachments
	accepts_nested_attributes_for :post_attachments

	belongs_to :blog

	def blog_name
		blog.name
	end

	def post_images
		post_attachments.map(&:attachment)
	end

	
end



class Photo < Post

	self.inheritance_column = 'post_type'

	has_many :post_attachments, foreign_key: :post_id
	accepts_nested_attributes_for :post_attachments

	def post_images
		post_attachments.map(&:attachment)
	end

end

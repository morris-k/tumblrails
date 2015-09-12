class Text < Post
	self.inheritance_column = 'post_type'

	validates :body, presence: true
end

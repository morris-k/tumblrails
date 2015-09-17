class Text < Post

	validates :body, presence: true

	def content_column_name
		'body'
	end

	def preserved_column_name
		'title'
	end

	alias_attribute :nestable_content, :body
	alias_attribute :preserved_content, :title
end

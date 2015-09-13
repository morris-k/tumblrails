module PostsHelper

	def post_view_name(post)
		"#{post.post_type.downcase.pluralize}/#{post.post_type.downcase}"
	end

	def klass(post)
		post.post_type.constantize
	end
end

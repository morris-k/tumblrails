module PostsHelper

	def post_view_name(post)
		"#{post.post_type.downcase.pluralize}/#{post.post_type.downcase}"
	end

	def permalink(post)
		blog_post_path(post_id: post.id, id: post.blog.id)
	end
end

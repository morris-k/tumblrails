class PostsController < ApplicationController

	def index
		if params[:tag].present?
			@posts = Post.tagged_with(params[:tag])
		else
			@posts = Post.all 
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to root_path
		else
			render @post
		end
	end

end

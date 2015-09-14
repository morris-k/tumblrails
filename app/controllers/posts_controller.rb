class PostsController < ApplicationController

	def index
		@posts = Post.all 
	end

	def search_tag
		@tag = params[:tag]
		@posts = Post.tagged_with(params[:tag])
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

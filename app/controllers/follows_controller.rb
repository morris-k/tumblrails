class FollowsController < ApplicationController

	def create
		@blog = Blog.find(params[:blog_id])
		current_user.follow(@blog)
		redirect_to root_path
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		current_user.unfollow(@blog)
		redirect_to root_path
	end
end

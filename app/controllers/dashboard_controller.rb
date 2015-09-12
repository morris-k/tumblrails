class DashboardController < ApplicationController

	def show
		@user = current_user
		@following = current_user.following
		@posts = current_user.dash_posts
	end
end

class TextsController < ApplicationController

	def new
		@text = Text.new
	end

	def create
		@text = Text.new(text_params)
		if @text.save
			redirect_to root_path
		else
			render :new
		end
	end


	private
	def text_params
		params.require(:text).permit(:title, :body, :blog_id, :tag_list, :is_reblog)
	end
end

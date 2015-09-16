class PhotosController < ApplicationController

	def new
		@photo = Photo.new
		@post_attachments = @photo.post_attachments.build
	end

	def create
		@photo = Photo.create(photo_params)
		if @photo.save
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:blog_id, :caption, :tag_list, :is_reblog, :post_attachments_attributes => [:post_id, :caption, :attachment])
	end
end

class PostAttachment < ActiveRecord::Base

	mount_uploader :attachment, PostAttachmentUploader
	belongs_to :post
end

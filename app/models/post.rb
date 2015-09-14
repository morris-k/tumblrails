class Post < ActiveRecord::Base
	default_scope { order('created_at DESC') }

	acts_as_taggable

	before_create :generate_reblog_key

	has_many :post_attachments
	accepts_nested_attributes_for :post_attachments

	belongs_to :blog


	def blog_name
		blog.name
	end 

	def post_images
		post_attachments.map(&:attachment)
	end

	def notes
		Note.where(reblog_key: reblog_key)
	end

	def note_count
		notes.length
	end

	protected

	def generate_reblog_key
		return if !self.reblog_key.nil?
		self.reblog_key = loop do
			random_key = SecureRandom.urlsafe_base64(nil, false)[0..7]
			break random_key unless Post.exists?(reblog_key: random_key)
		end
	end

	
end



module Notable
	extend ActiveSupport::Concern

	included do 
		after_create :make_note

		has_one :note, as: :notable, dependent: :destroy
	end

	def make_note
		self.create_note(reblog_key: self.reblog_key)
	end

end
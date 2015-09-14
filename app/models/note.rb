class Note < ActiveRecord::Base
	default_scope { order('created_at DESC') }
	
 	belongs_to :notable, polymorphic: true
end

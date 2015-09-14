class Like < ActiveRecord::Base
	include Notable

	belongs_to :liker, class_name: "User"
	belongs_to :liked, class_name: "Blog"
	belongs_to :post
end

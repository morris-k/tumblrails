class Reblog < ActiveRecord::Base
	include Notable

	belongs_to :reblogger, class_name: "Blog"
	belongs_to :reblogged, class_name: "Blog"
	belongs_to :post
	belongs_to :reblogged_post, class_name: "Post"
end

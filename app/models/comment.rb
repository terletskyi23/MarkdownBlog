class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	#validates :user_id, :post_id, numericality: true
    #validates :user_id, :post_id, :body, :presence => true
end

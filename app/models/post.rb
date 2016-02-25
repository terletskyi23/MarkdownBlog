class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :delete_all 
	has_many :commenters, through: :comments, source: :user

	acts_as_likeable

    validates :user_id, numericality: true
    validates :user_id, :title, :presence => true
end

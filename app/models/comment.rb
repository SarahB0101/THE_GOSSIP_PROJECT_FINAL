class Comment < ApplicationRecord

	validates :content,
		presence: true	
		
	belongs_to :user
	belongs_to :gossip
	#belongs_to :parent, polymorphic: true
	#has_many :comments, as: :parent
	has_many :likes
end

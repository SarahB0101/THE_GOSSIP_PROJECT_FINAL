class Gossip < ApplicationRecord
	validates :title,
		presence: true,
		length: { in: 3..14 }

	validates :content,
		presence: true		

	belongs_to :user
	has_many :join_table_gossip_tags
	has_many :tags, through: :join_table_gossip_tags
	has_many :comments
	has_many :likes

	def pre_like(user)
    self.likes.find { |like| like.user_id == user.id}
    end
	
end

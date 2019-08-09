class User < ApplicationRecord
	attr_accessor :remember_token


	validates :email, 
	    presence: true, 
	    uniqueness: true,
	    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email adress please" }

	validates :password, 
		presence: true, length: { minimum: 6 }

	validates :first_name, 
		presence: true, length: { maximum: 50 }

	validates :last_name, 
		presence: true, length: { maximum: 50 }

	validates :age, 
		presence: true, numericality: { only_integer: true, greater_than: 0}
	
	validates :description, 
		length: { maximum: 500 }

	validates :city, 
		presence: true, allow_nil: false
 
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :gossips
  has_many :comments
  belongs_to :city
  has_many :likes
  has_secure_password



	def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end


	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	#return true si token match avec digest
	def authenticated?(remember_token)
	    return false if remember_digest.nil?
	    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end

	# oublier un user.
	def forget
		update_attribute(:remember_digest, nil)
	end


end










class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	#validates :username,  presence: true, length: { maximum: 50 }
end

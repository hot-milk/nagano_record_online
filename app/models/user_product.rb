class UserProduct < ApplicationRecord
	belongs_to :user
	belongs_to :product

	validates :product_id, uniqueness: true
end

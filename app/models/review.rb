class Review < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :product

	validates :review_content,
		presence: true, length: {maximum: 300}

end

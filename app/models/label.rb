class Label < ApplicationRecord
	has_many :products

	validates :label_name, presence: true, length: {maximum: 20}, uniqueness: true
end

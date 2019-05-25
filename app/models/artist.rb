class Artist < ApplicationRecord
    has_many :products

	validates :artist_name, presence: true, length: {maximum: 20}, uniqueness: true
end

class Product < ApplicationRecord
	has_many :recorded_musics, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :user_products, dependent: :destroy
	has_many :order_items, dependent: :destroy
	belongs_to :artist

	accepts_nested_attributes_for :recorded_musics, allow_destroy: true

	enum product_category: [:シングル,:アルバム]
	enum status: [:販売中,:販売停止中]
	attachment :jacket_image

end

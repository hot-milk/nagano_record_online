class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy

	accepts_nested_attributes_for :order_items

	enum payment_method: {クレジットカード:1, 銀行振込:2, 代引き:3}

end

class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy

	accepts_nested_attributes_for :order_items

	enum payment_method: {クレジットカード:1, 銀行振込:2, 代引き:3}
	enum ship_status: {出荷準備中:1, 発送:2, 配達完了:3}

end

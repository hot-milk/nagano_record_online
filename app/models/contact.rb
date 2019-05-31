class Contact < ApplicationRecord
	belongs_to :user
	validates :title,
		length: {minium:1, maximum: 50}
	validates :contact_content,
		presence: true, length: {maximum: 1000}
end

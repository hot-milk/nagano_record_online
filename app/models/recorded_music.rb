class RecordedMusic < ApplicationRecord
	validates :recorded_music_number, presence: true
	validates :recorded_disk_number, presence: true
	validates :recorded_music_name, presence: true
	belongs_to :product

	validates :product_id, presence: true, numericality: true
	validates :recorded_music_name, presence: true
	validates :recorded_music_number, presence: true, numericality: true
	validates :recorded_disk_number, presence: true, numericality: true
end

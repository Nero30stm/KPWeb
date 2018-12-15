class Product < ApplicationRecord
	belongs_to :restaurant
	mount_uploader :mainPhoto, ImageUploader
end

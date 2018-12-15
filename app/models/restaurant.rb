class Restaurant < ApplicationRecord
	geocoded_by :addr
	after_validation :geocode, :if => :addr_changed?
	has_many :restreviews
	has_many :photoalbums
	has_many :products
	has_many :restbookings
	mount_uploader :mainPhoto, ImageUploader
	paginates_per 3

	def self.text_search(query)
		if query.present?
		   where("name @@ :q", q: query)
		else
		   all
		end
	end
end

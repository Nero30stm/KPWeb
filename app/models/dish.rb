class Dish < ApplicationRecord
	has_and_belongs_to_many:restaurants
end

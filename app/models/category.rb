class Category < ActiveRecord::Base

	has_many :has_categories
	has_many :articles, through: :has_categories

	validates :name, presence: true
	validates :color, presence: true

end

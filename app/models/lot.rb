class Lot < ApplicationRecord
	self.primary_key = 'lot_number'
	validates :lot_number, uniqueness: true
	has_many :bids
	accepts_nested_attributes_for :bids
end

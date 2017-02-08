class Lot < ApplicationRecord

	scope :make, -> (make) { where make: make }
  scope :color, -> (color) { where color: color }
  scope :drive, -> (drive) { where drive: drive }
  scope :has_keys, -> (has_keys) { where has_keys: has_keys }
  scope :year, -> (year) { where year: year }
  scope :state, -> (state) { where state: state }
  scope :lot_number, -> (lot_number) { where lot_number: lot_number }
  scope :buy_now_price, -> (buy_now_price) { where("buy_now_price > 0")}
  scope :auction, -> (auction) { Lot.joins(:bids).group('lots.id').having("count(bids.id)>0")}

	self.primary_key = 'lot_number'
	validates :lot_number, uniqueness: true
	has_many :bids
	accepts_nested_attributes_for :bids
end

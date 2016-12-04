class Bid < ApplicationRecord
	belongs_to :user
	belongs_to :lot

	def self.highest_bid(lot_id)

    max_amount = Bid.where(lot_id: lot_id).maximum("amount")
    bid_amount = max_amount || 0
    return bid_amount
  end

  private

  def default_values
  	self.user_id = current_user.id
  end
end

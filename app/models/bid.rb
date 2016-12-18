class Bid < ApplicationRecord
	belongs_to :user
	belongs_to :lot
  validate :amount_greater_than_higest_bid

	def self.highest_bid(lot_id)

    max_amount = Bid.where(lot_id: lot_id).maximum("amount")
    bid_amount = max_amount || 0
    return bid_amount
  end
  
  def amount_greater_than_higest_bid
    highest_bid_amount = Bid.where(lot_id: lot_id).maximum("amount") || 0
    amount = self.amount
    if amount > highest_bid_amount
      return true
    end
    if amount <= highest_bid_amount
      errors.add(:base, "Bid Amount should be greader than #{highest_bid_amount}")
      return false
    end

  end

  private


  def default_values
  	self.user_id = current_user.id
  end
end

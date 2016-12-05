class BidsController < ApplicationController
  before_action :authenticate_user!
  
  def create
  	@bid = Bid.find_or_initialize_by(lot_id: params[:lot_id], user_id: current_user.id)
  	@bid.assign_attributes(bid_params)

  		if @bid.save
  			render json: @bid
  		else
  			render json: @bid.errors
  		end
  end

  def update
  end

  private
  def bid_params
  	params.require(:bid).permit(:amount, :user_id, :lot_id)
  end
end

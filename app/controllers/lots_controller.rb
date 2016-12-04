class LotsController < ApplicationController

	before_action :set_lot, only: [:show]

  def show
  	#render json: @lot
  	@bid = Bid.new
  end

  private

  def set_lot
      @lot = Lot.find_by_lot_number(params[:id])
  end
end

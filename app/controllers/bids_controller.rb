class BidsController < ApplicationController
  before_action :authenticate_user!
  
  def create
  	@bid = Bid.find_or_initialize_by(lot_id: params[:lot_id], user_id: current_user.id)
  	@bid.assign_attributes(bid_params)

  		respond_to do |format|
        if @bid.save
          format.html { redirect_to lot_path(params[:lot_id]), notice: 'Bid added successfully.' }
        else
          format.html { redirect_to lot_path(params[:lot_id]), :flash => { :error => @bid.errors.full_messages.join(', ') } }
        end
      end
  end

  def update
  end

  private
  def bid_params
  	params.require(:bid).permit(:amount, :user_id, :lot_id)
  end
end

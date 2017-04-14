class Admin::BidsController < Admin::AdminController
	def approve
		@bid = Bid.update(params[:id], {status: 1})
	
		if @bid.status == 1
			UserMailer.bid_notification_awarded(@bid,@bid.user.email).deliver
			@lot = Lot.update(@bid.lot.id, {active_status: 0})
		end
		
		redirect_to "/lots/#{@bid.lot.id}"
	end

	def reject

		# TODS
		# Send email to winner admin will be in reply-to and cc subject will contain lot number and bid ID
		# Send email to all losers
		# Lot status will be updated to bidding closed
		@bid = Bid.destroy(params[:id])
		UserMailer.bid_notification_rejected(@bid,@bid.user.email).deliver
		redirect_to "/lots/#{@bid.lot.id}"
	end

end
class SearchController < ApplicationController
	def index
		@lots = Lot.paginate(:page => params[:page], :per_page => 20)
		filtering_params(params).each do |key, value|
    @lots = @lots.public_send(key, value) if value.present?
  	end
	end

	private

	# A list of the param names that can be used for filtering the Lots list
	def filtering_params(params)
  	params.slice(:make, :color, :drive, :has_keys, :year, :state, :lot_number, :buy_now_price, :auction)
	end

end

class SearchController < ApplicationController
	def index
		@lots = Lot.paginate(:page => params[:page], :per_page => 8)
	end
end

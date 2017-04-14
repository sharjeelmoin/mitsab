class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :destroy]

	def index
		@watchlists = Watchlist.where(user_id: current_user.id)
	end
  def create
    @watchlist = Watchlist.find_or_initialize_by(lot_id: params[:lot_id], user_id: current_user.id)
    @watchlist.assign_attributes(watchlist_params)


        if @watchlist.save
        	# render json: @watchlist
        	redirect_to lot_path(params[:lot_id]), notice: 'Added to Watchlist successfully.'
        end
  end

  def destroy
    if @watchlist.user_id = current_user.id
      @watchlist.destroy
      respond_to do |format|
        format.html { redirect_to '/watchlists', notice: 'Removed from watchlist successfully.' }
        format.json { head :no_content }
      end
    end
  end

  def show
    redirect_to '/watchlists'
  end
  private

  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
  end
  def watchlist_params
  	params.require(:watchlist).permit(:status, :user_id, :lot_id)
  end
end

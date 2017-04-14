class Admin::DashboardController < Admin::AdminController
	before_action :authenticate_admin!
	layout 'admin'
	def index
	end

	def auction
    @admin_lots = Lot.paginate(:page => params[:page], :per_page => 8)
  end

  def resque
  	
  end

	private
	def authenticate_admin!
    (current_user.nil?) ? redirect_to(new_user_session_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end
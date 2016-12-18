class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  def authenticate_admin!
    (current_user.nil?) ? redirect_to(new_user_session_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end
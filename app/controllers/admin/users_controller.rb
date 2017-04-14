class Admin::UsersController < Admin::AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  def index
  	@users = User.paginate(:page => params[:page], :per_page => 100)
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def create
  	@user = User.new(user_params)
  	# render json: @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'Successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'Lot was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :address_line1, :address_line2, :country, :state, :city, :zip, :phone , :email, :role)
  end

end

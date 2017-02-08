class Admin::LotsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_admin_lot, only: [:show, :edit, :update, :destroy]

  # GET /admin/lots
  # GET /admin/lots.json
  def index
    #@admin_lots = Lot.paginate(:page => params[:page], :per_page => 8)
    @admin_lots = Lot.paginate(:page => params[:page], :per_page => 20)
    filtering_params(params).each do |key, value|
    @admin_lots = @admin_lots.public_send(key, value) if value.present?
    end
  end

  # GET /admin/lots/1
  # GET /admin/lots/1.json
  def show
  end

  # GET /admin/lots/new
  def new
    @admin_lot = Lot.new
  end

  # GET /admin/lots/1/edit
  def edit
  end

  # POST /admin/lots
  # POST /admin/lots.json
  def create
    @admin_lot = Lot.new(admin_lot_params)

    respond_to do |format|
      if @admin_lot.save
        format.html { redirect_to @admin_lot, notice: 'Lot was successfully created.' }
        format.json { render :show, status: :created, location: @admin_lot }
      else
        format.html { render :new }
        format.json { render json: @admin_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/lots/1
  # PATCH/PUT /admin/lots/1.json
  def update
    respond_to do |format|
      if @admin_lot.update(admin_lot_params)
        format.html { redirect_to @admin_lot, notice: 'Lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_lot }
      else
        format.html { render :edit }
        format.json { render json: @admin_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/lots/1
  # DELETE /admin/lots/1.json
  def destroy
    @admin_lot.destroy
    respond_to do |format|
      format.html { redirect_to admin_lots_url, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_lot
      @admin_lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_lot_params
      params.require(:admin_lot).permit(:yard_number, :yard_name, :sale_date, :sale_time, :item_no, :lot_number, :vehicle_type, :year, :make, :model_group, :model_detail, :body_style, :color, :damage_description, :secondary_damage, :sale_title_state, :sale_title_type, :has_keys, :lot_cond_code, :vin, :odometer, :odometer_brand, :est_retail_value, :engine, :drive, :transmission, :fuel_type, :cylinders, :runs_drives, :sale_status, :high_bid, :special_note, :city, :state, :zip, :country, :currency_code, :thumbnail, :cop_created_date, :grid_rows, :offer_eligible, :buy_now_price)
    end

    def filtering_params(params)
    params.slice(:make, :color, :drive, :has_keys, :year, :state, :lot_number, :buy_now_price, :auction)
    end
end

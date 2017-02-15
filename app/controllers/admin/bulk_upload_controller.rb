class Admin::BulkUploadController < Admin::AdminController

	skip_before_filter :verify_authenticity_token 

  def index
  	@bulk_uploads = BulkUpload.all
  end

  def new
  	@bulk_upload = BulkUpload.new
  end

  def create
  	@bulk_upload = BulkUpload.new(bulk_upload_params)
  	# render json: @bulk_upload
    respond_to do |format|
      if @bulk_upload.save
        format.html { redirect_to admin_bulk_upload_index_path, notice: 'Successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
  	@bulk_upload = BulkUpload.find(params[:id])
  	@bulk_upload.destroy
    respond_to do |format|
      format.html { redirect_to admin_bulk_upload_index_path, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def csv
    # Saving each row as hash into array of csv_data
    @attachment_csv = BulkUpload.find(params[:id])
    if @attachment_csv
      @attachment_url = @attachment_csv.attachment.url
      # Resque.enqueue(Sleeper)
      ImportDataJob.perform_later(@attachment_url)
      redirect_to admin_bulk_upload_index_path, notice: "Background Job Schedueld"
    end

    # redirect_to '/resque'
  end


  private
  def bulk_upload_params
    params.require(:bulk_upload).permit(:attachment)
  end

end

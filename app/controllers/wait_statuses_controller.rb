class WaitStatusesController < ApplicationController
  before_action :set_wait_status, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource

  # GET /wait_statuses
  # GET /wait_statuses.json
  def index
    @current_wait_statuses = WaitStatus.current.order('table_type', 'start_date')
    respond_to do |format|
      format.html
      format.csv { send_data @current_wait_statuses.to_csv }
    end
  end

  # GET /wait_statuses/new
  def new
    @wait_status = WaitStatus.new
    @member = Member.find(params[:member_id])
  end

  # POST /wait_statuses
  # POST /wait_statuses.json
  def create
    @wait_status = WaitStatus.new(wait_status_params)
    @wait_status.start_date = Date.today
    @wait_status.employee_id = current_user.id
    respond_to do |format|
      if @wait_status.save
        format.html { redirect_to member_path(@wait_status.member_id), notice: 'Wait status was successfully created.' }
        format.json { render :show, status: :created, location: @wait_status }
      else
        format.html { render :new }
        format.json { render json: @wait_status.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wait_status
      @wait_status = WaitStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wait_status_params
      params.require(:wait_status).permit(:table_type, :start_date, :member_id, :employee_id)
    end
end

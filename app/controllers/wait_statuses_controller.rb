class WaitStatusesController < ApplicationController
  before_action :set_wait_status, only: [:show, :edit, :update, :destroy]

  # GET /wait_statuses
  # GET /wait_statuses.json
  def index
    @wait_statuses = WaitStatus.all
  end

  # GET /wait_statuses/1
  # GET /wait_statuses/1.json
  def show
  end

  # GET /wait_statuses/new
  def new
    @wait_status = WaitStatus.new
  end

  # GET /wait_statuses/1/edit
  def edit
  end

  # POST /wait_statuses
  # POST /wait_statuses.json
  def create
    @wait_status = WaitStatus.new(wait_status_params)

    respond_to do |format|
      if @wait_status.save
        format.html { redirect_to @wait_status, notice: 'Wait status was successfully created.' }
        format.json { render :show, status: :created, location: @wait_status }
      else
        format.html { render :new }
        format.json { render json: @wait_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wait_statuses/1
  # PATCH/PUT /wait_statuses/1.json
  def update
    respond_to do |format|
      if @wait_status.update(wait_status_params)
        format.html { redirect_to @wait_status, notice: 'Wait status was successfully updated.' }
        format.json { render :show, status: :ok, location: @wait_status }
      else
        format.html { render :edit }
        format.json { render json: @wait_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wait_statuses/1
  # DELETE /wait_statuses/1.json
  def destroy
    @wait_status.destroy
    respond_to do |format|
      format.html { redirect_to wait_statuses_url, notice: 'Wait status was successfully destroyed.' }
      format.json { head :no_content }
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

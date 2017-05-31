class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update, :destroy]
  before_action :check_login

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.current
  end

  # GET /registrations/new
  def new
    # check if the page was accessed correctly
    if params[:member_id].nil?
      flash[:error] = "Please create a registration path for a member from their profile page"
      redirect_to registrations_path
      return false
    end

    if registration_already_exists?(params[:member_id].to_i)
      flash[:error] = "An ongoing registration for this member already exists."
      redirect_to member_path(params[:member_id])
      return false
    end
    @registration = Registration.new
    @member = Member.find(params[:member_id])
  end

  # GET /registrations/1/edit
  def edit
    @member = Member.find(@registration.member_id)
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)
    @registration.employee_id = current_user.id
    respond_to do |format|
      if @registration.save
        format.html { redirect_to member_path(@registration.member_id), notice: 'Registration was successfully created.' }
      else
        @member = Member.find(@registration.member_id)
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to member_path(@registration.member_id), notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def registration_already_exists?(member_id)
      Registration.all.each do |r|
        if r.member_id == member_id and 
           r.start_date <= Date.today and 
           Date.today <= r.end_date
          return true
        end
      end
      false
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:member_id, :seat_number, :start_date, :end_date, :employee_id)
    end
end

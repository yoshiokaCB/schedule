class TimetableUsersController < ApplicationController
  before_action :set_timetable_user, only: [:show, :edit, :update, :destroy]

  # GET /timetable_users
  # GET /timetable_users.json
  def index
    @timetable_users = TimetableUser.all
  end

  # GET /timetable_users/1
  # GET /timetable_users/1.json
  def show
  end

  # GET /timetable_users/new
  def new
    @timetable_user = TimetableUser.new
  end

  # GET /timetable_users/1/edit
  def edit
  end

  # POST /timetable_users
  # POST /timetable_users.json
  def create
    @timetable_user = TimetableUser.new(timetable_user_params)

    respond_to do |format|
      if @timetable_user.save
        format.html { redirect_to @timetable_user, notice: 'Timetable user was successfully created.' }
        format.json { render :show, status: :created, location: @timetable_user }
      else
        format.html { render :new }
        format.json { render json: @timetable_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetable_users/1
  # PATCH/PUT /timetable_users/1.json
  def update
    respond_to do |format|
      if @timetable_user.update(timetable_user_params)
        format.html { redirect_to @timetable_user, notice: 'Timetable user was successfully updated.' }
        format.json { render :show, status: :ok, location: @timetable_user }
      else
        format.html { render :edit }
        format.json { render json: @timetable_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetable_users/1
  # DELETE /timetable_users/1.json
  def destroy
    @timetable_user.destroy
    respond_to do |format|
      format.html { redirect_to timetable_users_url, notice: 'Timetable user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable_user
      @timetable_user = TimetableUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_user_params
      params.require(:timetable_user).permit(:user_id, :timetable_id, :notice, :program_name)
    end
end

class TimetablePropertiesController < ApplicationController
  before_action :set_timetable_property, only: [:show, :edit, :update, :destroy]

  # GET /timetable_properties
  # GET /timetable_properties.json
  def index
    @timetable_properties = TimetableProperty.all
  end

  # GET /timetable_properties/1
  # GET /timetable_properties/1.json
  def show
  end

  # GET /timetable_properties/new
  def new
    @timetable_property = TimetableProperty.new
  end

  # GET /timetable_properties/1/edit
  def edit
  end

  # POST /timetable_properties
  # POST /timetable_properties.json
  def create
    @timetable_property = TimetableProperty.new(timetable_property_params)

    respond_to do |format|
      if @timetable_property.save
        format.html { redirect_to @timetable_property, notice: 'Timetable property was successfully created.' }
        format.json { render :show, status: :created, location: @timetable_property }
      else
        format.html { render :new }
        format.json { render json: @timetable_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetable_properties/1
  # PATCH/PUT /timetable_properties/1.json
  def update
    respond_to do |format|
      if @timetable_property.update(timetable_property_params)
        format.html { redirect_to @timetable_property, notice: 'Timetable property was successfully updated.' }
        format.json { render :show, status: :ok, location: @timetable_property }
      else
        format.html { render :edit }
        format.json { render json: @timetable_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetable_properties/1
  # DELETE /timetable_properties/1.json
  def destroy
    @timetable_property.destroy
    respond_to do |format|
      format.html { redirect_to timetable_properties_url, notice: 'Timetable property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable_property
      @timetable_property = TimetableProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_property_params
      params.require(:timetable_property).permit(:timetable_id, :upper_limit)
    end
end

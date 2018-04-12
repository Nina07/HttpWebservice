class DeviceDataController < ApplicationController
  # GET /device_data
  def index
    device_data = DeviceDatum.where(identifier: params[:identifier], date_time: params[:date_time], unit: params[:unit]).first
    if device_data
    	render json: device_data
    else
    	render json: {status: 404, message: "Record doesn't exist!"}
    end
  end

  # POST /device_data
  def create
    @device_datum = DeviceDatum.new(device_datum_params)
    if @device_datum.save
      render json: @device_datum, status: :created
    else
      render json: @device_datum.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def device_datum_params
      params.require(:device_datum).permit(:identifier, :date_time, :value, :unit)
    end
end

class TracesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_trace, only: [:show, :update, :destroy]
  include Calcs

  # GET /traces
  # GET /traces.json
  def index
    @traces = Trace.all
    url_string = ''
    data = []
    pdist = 0
    plat = @traces.first.latitude
    plon = @traces.first.longitude
    traces = @traces.pluck(:latitude, :longitude).map { |lat, lon| { latitude: lat, longitude: lon } }
    response = HTTParty.post(
      url_string,
      :body => traces.to_json,
      :headers => { 'Content-Type' => 'application/json' }
    )
    @traces.each_with_index do |t,index|
      data << {
        "latitude": t.latitude,
        "longitude": t.longitude,
        "distance":  distance([plat,plon],[t.latitude, t.longitude]) + pdist,
        "elevation": response[index]
      }
      pdist += distance([plat,plon],[t.latitude, t.longitude])
      plat = t.latitude
      plon = t.longitude
    end
    render json: data
  end

  # GET /traces/1
  # GET /traces/1.json
  def show
    @traces = Trace.find_by(id: params[:id])
    url_string = ''
    response = HTTParty.get(url_string)
    data = {
      "latitude": @traces.latitude,
      "longitude": @traces.longitude,
      "elevation": response.body.to_i
    }
    render json: data
  end

  # POST /traces
  # POST /traces.json
  def create
    data = []
    trace_params.each do |p|
      hash = {
        latitude: p["latitude"],
        longitude: p["longitude"]
      }
      data << hash
    end

    if Trace.upload_data(data)
      render json: {status: 'OK'}
    else
      render json: @trace.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /traces/1
  # PATCH/PUT /traces/1.json
  def update
    if @trace.update(trace_params)
      render :show, status: :ok, location: @trace
    else
      render json: @trace.errors, status: :unprocessable_entity
    end
  end

  # DELETE /traces/1
  # DELETE /traces/1.json
  def destroy
    @trace.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trace
      @trace = Trace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trace_params
      params.require(:_json).map do |p|
        p.permit(:latitude, :longitude)
      end
    end
end

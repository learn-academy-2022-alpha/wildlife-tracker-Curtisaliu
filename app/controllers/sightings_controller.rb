class SightingsController < ApplicationController

  def index
    all_sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: all_sightings
  end

  def show
    one_sighting = Sighting.find(params[:id])
    render json: one_sighting
  end

  def update
    one_sighting = Sighting.find(params[:id])
    one_sighting.update(sighting_params)
    if one_sighting.valid?
      render json: one_sighting
    else
      render json: one_sighting.errors
    end
  end

  def destroy
    one_sighting = Sighting.find(params[:id])
    if one_sighting.destroy
      render json: one_sighting
    else
      render json: one_sighting.errors
    end
  end

  private
  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitude, :start_date, :end_date)
  end
end

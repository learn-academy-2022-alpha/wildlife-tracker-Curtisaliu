class AnimalsController < ApplicationController
  def index
    all_animals = Animal.all
    render json: all_animals.as_json(include: :sightings)
  end

  def update
    one_animal = Animal.find(params[:id])
    one_animal.update(animal_params)
    if one_animal.valid?
      render json: one_animal.errors
    end
  end

  def destroy
    one_animal = Animal.find(params[:id])
    if one_animal.destroy
      render json: one_animal
    else
      render json: one_animal.errors
    end
  end


  private
  def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom, sightings_attributes: [:latitude, :longitude, :date])
  end
end

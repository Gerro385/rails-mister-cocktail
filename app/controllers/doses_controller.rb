class DoseController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @ingredients = Ingredient.all

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(@dose)
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

end

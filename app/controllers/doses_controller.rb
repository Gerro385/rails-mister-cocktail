class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @ingredients = Ingredient.all

    if @dose.save!
      redirect_to @cocktail
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
    params.require(:dose).permit(:description, :ingredient_id)
  end

end

class DosesController < ApplicationController

  before_action :set_cocktail, only: [:create, :new]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # Here we are setting the cocktail dose to the cocktail
    #1 table spoon lemon juice = what cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    Dose.find(params[:id]).destroy
  end

  private

  def set_cocktail
   @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def random
    @cocktail_number = Cocktail.all.count
    @cocktail = Cocktail.find((1..@cocktail_number).to_a.sample)
    redirect_to cocktail_path(@cocktail)

  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :colour, :photo)
  end
end

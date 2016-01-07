class BourbonsController < ApplicationController
  def index
    @bourbons = Bourbon.page(params[:page])
  end

  def show
    @bourbon = Bourbon.find(params[:id])
    @reviews = @bourbon.reviews
  end

  def new
    @bourbon = Bourbon.new
  end

  def edit
    @bourbon = Bourbon.find(params[:id])
  end

  def create
    @bourbon = Bourbon.new(bourbon_params)
    @bourbon.user = current_user

    if @bourbon.save
      flash[:notice] = "Bourbon added successfully"
      redirect_to bourbon_path(@bourbon)
    else
      flash.now[:errors] = @bourbon.errors.full_messages.join(". ")
      render :new
    end
  end

  def update
    @bourbon = Bourbon.find(params[:id])

    if @bourbon.update_attributes(bourbon_params)
      flash[:notice] = 'Bourbon updated successfully'
      redirect_to bourbon_path(@bourbon)
    else
      flash.now[:error] = @bourbon.errors.full_messages.join(". ")
      render :edit
    end
  end

  private

  def bourbon_params
    params.require(:bourbon).permit(:user, :name, :proof, :distillery, :varietal)
  end
end

class BourbonsController < ApplicationController
  def index
    # @bourbons = Bourbon.all.reverse
    @bourbons = Bourbon.page(params[:page])
  end

  def show
    @bourbon = Bourbon.find(params[:id])
  end

  def new
    @bourbon = Bourbon.new
  end

  def edit
    @bourbon = Bourbon.find(params[:id])
  end

  def create
    @bourbon = Bourbon.new(bourbon_params)

    if @bourbon.save
      flash[:notice] = "Bourbon added successfully"
      redirect_to bourbon_path(@bourbon)
    else
      flash[:errors] = @bourbon.errors.full_messages.join(" + ")
      render :new
    end
  end

  def update
    @bourbon = Bourbon.find(params[:id])

    if @bourbon.update_attributes(bourbon_params)
      flash[:notice] = 'Bourbon updated successfully'
      redirect_to bourbon_path(@bourbon)
    else
      flash[:error] = @bourbon.errors.full_messages.join(" + ")
      render :edit
    end
  end

  private

  def bourbon_params
    params.require(:bourbon).permit(:name, :proof, :distillery, :varietal)
  end
end

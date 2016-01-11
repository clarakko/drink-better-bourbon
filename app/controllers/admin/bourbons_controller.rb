class Admin::BourbonsController < ApplicationController
  before_filter :authorize_admin!

  def index
    @bourbons = Bourbon.all.page(params[:page])
  end

  def show
    @bourbon = Bourbon.find(params[:id])
    @reviews = @bourbon.reviews
  end

  def destroy
    @bourbon = Bourbon.find(params[:id]).destroy
    flash[:notice] = "Oh man, that bourbon is GONE DUDE."
    redirect_to admin_bourbons_path
  end

end

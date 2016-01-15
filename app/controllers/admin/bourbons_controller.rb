class Admin::BourbonsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @image_queue = Bourbon.where(bourbon_img: nil).last(5)
    @bourbons = Bourbon.order(created_at: :desc).page(params[:page])
  end

  def edit
    @bourbon = Bourbon.find(params[:id])
  end

  def update
    @bourbon = Bourbon.find(params[:id])

    if params[:bourbon]
      if @bourbon.update_attributes(bourbon_params)
        flash[:notice] = 'Bourbon updated successfully'
        redirect_to admin_bourbons_path
      else
        flash.now[:error] = @bourbon.errors.full_messages.join(". ")
        render :edit
      end
    else
      flash[:error] = 'You must attach an image first!'
      redirect_to admin_bourbons_path
    end
  end

  def destroy
    @bourbon = Bourbon.find(params[:id]).destroy
    flash[:notice] = "Oh man, that bourbon is GONE DUDE."
    redirect_to admin_bourbons_path
  end

  private

  def bourbon_params
    params.require(:bourbon).permit(
      :user, :name, :proof, :distillery, :varietal, :bourbon_img)
  end
end

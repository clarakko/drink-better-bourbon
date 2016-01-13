class BourbonsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update]
  before_action :authorize_admin!, only: [:destroy]

  def index
    if params[:search]
      @bourbons = Bourbon.search(params[:search]).
        order("name").
        page(params[:page])
    else
      @bourbons = Bourbon.order("name").page(params[:page])
    end
  end

  def show
    @bourbon = Bourbon.find(params[:id])
    @reviews = @bourbon.reviews
    @vote_total = Vote.group(:review_id).sum(:vote)
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

  def destroy
    @bourbon = Bourbon.find(params[:id]).destroy
    flash[:notice] = "Oh man, that bourbon is GONE DUDE."
    redirect_to bourbons_path
  end

  private

  def bourbon_params
    params.require(:bourbon).permit(
      :user, :name, :proof, :distillery, :varietal)
  end

  def authorize_user!
    user = Bourbon.find(params[:id]).user
    unless current_user == user || current_user.admin?
      flash[:alert] = "You Are Not Authorized To View The Page"
      redirect_to after_sign_in_path_for(current_user)
    end
  end
end

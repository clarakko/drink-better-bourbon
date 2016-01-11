class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!

  def index
    @users = User.all.page(params[:page])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "Oh my Gawd that dude was annoying!"
    redirect_to admin_users_path
  end
end

class Admin::ReviewsController < ApplicationController
  before_filter :authorize_admin!

  def destroy
    review = Review.find(params[:id])
    bourbon = review.bourbon
    review.destroy
    flash[:notice] = "You're right, that opinion sucked anyway."
    redirect_to admin_bourbon_path(bourbon)
  end

end
